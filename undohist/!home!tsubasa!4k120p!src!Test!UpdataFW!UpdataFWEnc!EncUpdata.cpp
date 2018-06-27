
((digest . "f9590a6f0a144c720ea3e08613c45cbc") (undo-list nil ("~" . -6128) ((marker . 6128) . -1) 6129 nil (6128 . 6129) (t 23345 61840 251484 715000) nil ("
" . 5907) ((marker . 6129) . -1) nil ("            transBufferSize += ENC_MEM_AREA_SIZE;" . 5907) nil ("
" . 5907) ((marker . 6129) . -1) nil ("            // ž���Хåե���������64KB�ʤ��" . 5907) nil ("2" . -9634) ((marker . 6128) . -1) ("7" . -9635) ((marker . 6128) . -1) ("6" . -9636) ((marker . 6128) . -1) 9637 nil (9634 . 9637) (t 23345 61179 127004 700000) nil (2989 . 10797) ("int transBufferSize = 0;

        std::cout << *itr<< \" FILE TRANSFER START.\"<<  std::endl;
        
        // UpdataEncFw���饹�Υ��󥹥��󥹲�
        UpdataEncFW *updataFile;
        updataFile = UpdataEncFW::getInstance();
        
        // ENC�ؤ�HostIF���󥹥��󥹲�
        HostIF *fpgaTrans;
        fpgaTrans = new HostIF(HostIF::FpgaType::HFR_ZYNQ_ENC);
        
        // �ե�����̾���ե�����ID���ե����륵�����Υ��å�
        UpdataEncFW::setFileName(*itr);
        
        UpdataEncFW::setFileID(
            UpdataEncFW::checkFileID(updataFile->getFileName()));
        UpdataEncFW::setFileSize(
            UpdataEncFW::checkFileSize(updataFile->getFileName()));    

        // for Debug
        std::cout << \"setFilename=\" <<updataFile->getFileName() << \" setFilesize=\"
            << updataFile->getFileSize() << std::endl;
                
        // �饤�ȥХåե��������򣶣�KBñ�̤˳�꿶�����
        int plusBuffersize = (updataFile->getFileSize() 
                % ENC_MEM_AREA_SIZE);
        int bufferSize = updataFile->getFileSize()
            + plusBuffersize;

        // for debug
        printf(\"bufferSize =%d \\n\",bufferSize);
        
        
        // �饤�ȥХåե���������ե��������Ƥ�񤭹���
        char buffer[bufferSize];

        std::cout << \"WriteDataBuffer Start\" << std::endl;

        ret = UpdataEncFW::WriteDataBuffer(*updataFile,buffer);
        if(ret == UPDATA_FILE_TRANSFER_ERR)
        {
            return UPDATA_FILE_TRANSFER_ERR;
        }

        std::cout << \"WriteDataBuffer End\" << std::endl;
        
        pbuf = buffer;

        //
        // �ե�����ž�����Ͻ���
        //
        
        // �ե�����ž�����֤�ư��ؼ��쥸�����˽񤭹���
        UpdataEncFW::writeAddress(fpgaTrans,
                Fpga4K120PEncReg::OPERATION_INSTRUCTION,
                ENC_OPERATION_FILE_TRANS);

        printf(\"file trans operation Write end\\n\");

        
        // �ե����륹�ơ��������ե�����ž�����֤ˤʤ�ޤǥݡ����
        for (int i=0;i< WAIT_LOOP_COUNT_MAX;++i)
        {
            fileStatus = UpdataEncFW::checkFileStatus(fpgaTrans);

            printf(\"getStatus =%d \\n\",fileStatus);
            
            if (fileStatus == ENC_FILE_STATE_TRANS_OK) break;
            
            sleep(TIMEOUT_WAIT_TIME);
        }
        if (fileStatus !=ENC_FILE_STATE_TRANS_OK)
        {
            // �����ॢ���ȥ��顼
            return UPDATA_FILE_TRANSFER_ERR;
        }
        
        transBufferSize = 0;
        
        //
        // �񤭹��ߥǡ���ž������
        //

        // ž�����������饤�ȥХåե���������Ķ�����Ȥ���ǽ�λ
        while (transBufferSize >= bufferSize)
        {
            
            // �ǡ����Хåե��Х󥯥쥸�����˽񤭹���
            UpdataEncFW::changeBankMemArea(fpgaTrans);


            // �Х󥯣�˽񤭹���
            UpdataEncFW::writeMemArea(fpgaTrans,pbuf);
            // 64KB�饤�ȥХåե�����˿ʤ��
            pbuf += ENC_MEM_AREA_SIZE;
 
            
            // ž���Хåե���������64KB�ʤ��
            transBufferSize += ENC_MEM_AREA_SIZE;
        }

        // �ե�����ID���ե����륵�������ե�����CRC��쥸�����˽񤭹���
        UpdataEncFW::writeFileInfo(
            fpgaTrans,
            updataFile->getFileID(),
            updataFile->getFileSize()
        );
        
        
        // FLASH�񤭹��߻ؼ���ե�����ư��ؼ��쥸�����˽񤭹���
        UpdataEncFW::writeAddress(fpgaTrans,
                Fpga4K120PEncReg::FILE_OPERATION_INSTRUCTION,
                ENC_FILE_OPERATION_WRITE);

        // for debug
        printf(\"FLASH WRITE operation set\\n\");        
     
        // �ե����륹�ơ�������ư�λ���֤ˤʤ�ޤǥݡ����
        for (int i=0;i< WAIT_LOOP_COUNT_MAX;++i)
        {
            fileStatus = UpdataEncFW::checkFileStatus(fpgaTrans);

            //for debug
            if (fileStatus == ENC_FILE_STATE_TRANS_OK) break;
            //if (fileStatus == ENC_FILE_STATE_OPERATION_END) break;
            
            sleep(TIMEOUT_WAIT_TIME);
        }
        // for debug
        if (fileStatus != ENC_FILE_STATE_TRANS_OK)
          //if (fileStatus != ENC_FILE_STATE_OPERATION_END)
        {
            //�����ॢ���ȥ��顼
            return UPDATA_FILE_TRANSFER_ERR;
        }
        
        //
        // �ե�����ž����λ
        //

        // for debug
        printf(\"FILE TRANSFER END \\n\");
        
        // �ե�����ž���ؼ���ե�����ư��ؼ��쥸�����˽񤭹���
        UpdataEncFW::writeAddress(fpgaTrans,
                Fpga4K120PEncReg::FILE_OPERATION_INSTRUCTION,
                ENC_FILE_OPERATION_TRANSFER);


        std::cout << *itr<< \" FILE TRANSFER END.\"<<  std::endl;
    }
    return UPDATA_FILE_TRANSFER_OK;
}

/*
 * �ե�����ID����.
 * �ե�����̾����ե�����ID���������
 *
 * @param[in] �ե�����̾
 * @return �ե�����ID
 */
int
UpdataEncFW::checkFileID(std::string fileName)
{
    // FILE ID �ޤ�������󤬤ʤ��Τ���α
    return 0;
}


/*
 * �ե����륵��������.
 * �ե�����̾����ե����륵�������������
 *
 * @param[in] �ե�����̾
 * @return �ե����륵����
 */
int
UpdataEncFW::checkFileSize(std::string fileName)
{
    int fd;
    // �ե�����򥪡��ץ�
    fd = open(fileName.c_str(),O_RDWR);
    if(fd == -1)
    {
        std::cerr << \"Failed to open \" << fileName << std::endl;
        return -1;
    }

    // �ե�������ֹ�¤�Τ�������ơ����������֤�
    struct stat fileStat;
    fstat(fd,&fileStat);
    
    return fileStat.st_size;
}

/*
 * �ե�����������.
 * �ե�����ID,�ե����륵�������ե�����CRC��쥸�����˽񤭹���
 *
 * @param[in] HostIF�Υ��󥹥��󥹤Υݥ���
 * @param[in] �ե�����ID
 * @param[in] �ե����륵����
 * @param[in] �ե�����CRC
 */
void
UpdataEncFW::writeFileInfo(HostIF* encBoard,int fileID,int fileSize)
{
    // ����񤭴�����ǽ��UPDATE_FILE_ID��fileID��񤭹���
    encBoard->write(Fpga4K120PEncReg::BLOCK_MAIN,
            Fpga4K120PEncReg::FILE_INDENTIFICATION,
            ENC_UPDATA_DATA_SIZE,
            (unsigned int*)&fileID);
    
    // ����񤭴�����ǽ��UPDATE_FILE_SIZE��fileSize��񤭹���
    encBoard->write(Fpga4K120PEncReg::BLOCK_MAIN,
            Fpga4K120PEncReg::FILE_SIZE,
            ENC_UPDATA_DATA_SIZE,
            (unsigned int*)&fileSize);

    return;
}
/*
 * �ǡ����Хåե��˽��.
 * UpdataEncFW���󥹥��󥹤���Хåե��˽񤭹���
 * ���碌�ƥե�����ݥ��󥿤�����
 *
 * @param[in] UpdataEncFW���󥹥���
 * @param[out] �ե��������ƤΥХåե� 
 *
 * @return �ե����륵����
 */
int
UpdataEncFW::WriteDataBuffer(UpdataEncFW upEncDat,char* fileBuffer)
{
    int ret;
    
    int fd = open(upEncDat.getFileName().c_str(),O_RDWR);
    if(fd == -1){
        std::cerr << \"Failed to open \"<< upEncDat.getFileName() << std::endl;
        return UPDATA_FILE_TRANSFER_ERR;
    }
    
    upEncDat.setFileFD(fd);
    
    char *pbuf = fileBuffer;
    ret = read(fd,pbuf,upEncDat.getFileSize());
    if (ret < 0) {
        std::cout << upEncDat.getFileName() << \" Read error\" << std::endl;
        return UPDATA_FILE_TRANSFER_ERR;
    }
    return UPDATA_FILE_TRANSFER_OK;
}

/*
 * ���ꥢ�ɥ쥹�ؽ��.
 * ���ꤷ�����ɥ쥹�˥ǡ����񤭹��ߤ�Ԥ�
 *
 * @param[in] HostIF���󥹥��󥹤Υݥ���
 * @param[in] �񤭹��߻��ꥢ�ɥ쥹
 * @param[in] �񤭹��ߥǡ���
 *
 */
void
UpdataEncFW::writeAddress(HostIF* encBoard,int writeAddress,
        unsigned int writeDat)
{
    encBoard->write(Fpga4K120PEncReg::BLOCK_MAIN,
            writeAddress,
            ENC_UPDATA_DATA_SIZE,
            &writeDat);

    return;
}

/*
 * �Х󥯥�����.
 * �Х󥯣�ˣ���KB�ν񤭹��ߤ�Ԥ�
 *
 * @param[in] HostIF���󥹥��󥹤Υݥ���
 * @param[in] �Хåե�����Ƭ���֤����Ѥߡ�
 *
 */
void
UpdataEncFW::writeMemArea(HostIF* encBoard,char* writeBuffer)
{
    //for debug
    printf(\"Enter UpdataEncFW::writeMemArea\\n\");
    
    encBoard->write(Fpga4K120PEncReg::BLOCK_MAIN,
            ENC_BANK_ADR, // BANK��Ƭ���ɥ쥹���狼�ä����ѹ�
            ENC_MEM_AREA_SIZE,
            (unsigned int *)writeBuffer);
    return;
}

/*
 * �Х󥯥�������.
 * �Х󥯥����ڤ��ؤ���Ԥ�
 *
 * @param[in] HostIF���󥹥��󥹤Υݥ���
 *
 */
void
UpdataEncFW::changeBankMemArea(HostIF* encBoard)
{
    //for debug
    printf(\"Enter UpdataEncFW::changeBankmemArea\\n\");

    unsigned int writeBuffer = 0" . 2989) ((marker . 5907) . -7357) 10711 (t 23329 65430 39414 83000) nil (3528 . 3536) ("                " . 3528) 3536 nil ("
" . 3536) (t 23329 65343 492162 83000) nil (3536 . 3537) nil ("
" . 3536) (t 23329 65343 492162 83000) nil (2361 . 2362) nil (nil rear-nonsticky nil 2360 . 2361) (nil fontified nil 2357 . 2361) (nil fontified nil 2356 . 2357) (nil fontified nil 2350 . 2356) (nil fontified nil 2338 . 2350) (2338 . 2361) nil ("
" . 2338) nil ("            return ret;" . 2338) (t 23329 46366 494007 0)))
