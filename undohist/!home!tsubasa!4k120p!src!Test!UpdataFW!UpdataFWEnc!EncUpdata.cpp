
((digest . "f9590a6f0a144c720ea3e08613c45cbc") (undo-list nil ("~" . -6128) ((marker . 6128) . -1) 6129 nil (6128 . 6129) (t 23345 61840 251484 715000) nil ("
" . 5907) ((marker . 6129) . -1) nil ("            transBufferSize += ENC_MEM_AREA_SIZE;" . 5907) nil ("
" . 5907) ((marker . 6129) . -1) nil ("            // 転送バッファサイズを64KB進める" . 5907) nil ("2" . -9634) ((marker . 6128) . -1) ("7" . -9635) ((marker . 6128) . -1) ("6" . -9636) ((marker . 6128) . -1) 9637 nil (9634 . 9637) (t 23345 61179 127004 700000) nil (2989 . 10797) ("int transBufferSize = 0;

        std::cout << *itr<< \" FILE TRANSFER START.\"<<  std::endl;
        
        // UpdataEncFwクラスのインスタンス化
        UpdataEncFW *updataFile;
        updataFile = UpdataEncFW::getInstance();
        
        // ENCへのHostIFインスタンス化
        HostIF *fpgaTrans;
        fpgaTrans = new HostIF(HostIF::FpgaType::HFR_ZYNQ_ENC);
        
        // ファイル名、ファイルID、ファイルサイズのセット
        UpdataEncFW::setFileName(*itr);
        
        UpdataEncFW::setFileID(
            UpdataEncFW::checkFileID(updataFile->getFileName()));
        UpdataEncFW::setFileSize(
            UpdataEncFW::checkFileSize(updataFile->getFileName()));    

        // for Debug
        std::cout << \"setFilename=\" <<updataFile->getFileName() << \" setFilesize=\"
            << updataFile->getFileSize() << std::endl;
                
        // ライトバッファサイズを６４KB単位に割り振る処理
        int plusBuffersize = (updataFile->getFileSize() 
                % ENC_MEM_AREA_SIZE);
        int bufferSize = updataFile->getFileSize()
            + plusBuffersize;

        // for debug
        printf(\"bufferSize =%d \\n\",bufferSize);
        
        
        // ライトバッファを取得しファイル内容を書き込み
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
        // ファイル転送開始処理
        //
        
        // ファイル転送状態を動作指示レジスタに書き込み
        UpdataEncFW::writeAddress(fpgaTrans,
                Fpga4K120PEncReg::OPERATION_INSTRUCTION,
                ENC_OPERATION_FILE_TRANS);

        printf(\"file trans operation Write end\\n\");

        
        // ファイルステータスがファイル転送状態になるまでポーリング
        for (int i=0;i< WAIT_LOOP_COUNT_MAX;++i)
        {
            fileStatus = UpdataEncFW::checkFileStatus(fpgaTrans);

            printf(\"getStatus =%d \\n\",fileStatus);
            
            if (fileStatus == ENC_FILE_STATE_TRANS_OK) break;
            
            sleep(TIMEOUT_WAIT_TIME);
        }
        if (fileStatus !=ENC_FILE_STATE_TRANS_OK)
        {
            // タイムアウトエラー
            return UPDATA_FILE_TRANSFER_ERR;
        }
        
        transBufferSize = 0;
        
        //
        // 書き込みデータ転送処理
        //

        // 転送サイズがライトバッファサイズを超えたところで終了
        while (transBufferSize >= bufferSize)
        {
            
            // データバッファバンクレジスタに書き込み
            UpdataEncFW::changeBankMemArea(fpgaTrans);


            // バンクｎに書き込み
            UpdataEncFW::writeMemArea(fpgaTrans,pbuf);
            // 64KBライトバッファを先に進める
            pbuf += ENC_MEM_AREA_SIZE;
 
            
            // 転送バッファサイズを64KB進める
            transBufferSize += ENC_MEM_AREA_SIZE;
        }

        // ファイルID、ファイルサイズ、ファイルCRCをレジスタに書き込み
        UpdataEncFW::writeFileInfo(
            fpgaTrans,
            updataFile->getFileID(),
            updataFile->getFileSize()
        );
        
        
        // FLASH書き込み指示をファイル動作指示レジスタに書き込み
        UpdataEncFW::writeAddress(fpgaTrans,
                Fpga4K120PEncReg::FILE_OPERATION_INSTRUCTION,
                ENC_FILE_OPERATION_WRITE);

        // for debug
        printf(\"FLASH WRITE operation set\\n\");        
     
        // ファイルステータスが動作完了状態になるまでポーリング
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
            //タイムアウトエラー
            return UPDATA_FILE_TRANSFER_ERR;
        }
        
        //
        // ファイル転送終了
        //

        // for debug
        printf(\"FILE TRANSFER END \\n\");
        
        // ファイル転送指示をファイル動作指示レジスタに書き込み
        UpdataEncFW::writeAddress(fpgaTrans,
                Fpga4K120PEncReg::FILE_OPERATION_INSTRUCTION,
                ENC_FILE_OPERATION_TRANSFER);


        std::cout << *itr<< \" FILE TRANSFER END.\"<<  std::endl;
    }
    return UPDATA_FILE_TRANSFER_OK;
}

/*
 * ファイルID取得.
 * ファイル名からファイルIDを取得する
 *
 * @param[in] ファイル名
 * @return ファイルID
 */
int
UpdataEncFW::checkFileID(std::string fileName)
{
    // FILE ID まだ確定情報がないので保留
    return 0;
}


/*
 * ファイルサイズ取得.
 * ファイル名からファイルサイズを取得する
 *
 * @param[in] ファイル名
 * @return ファイルサイズ
 */
int
UpdataEncFW::checkFileSize(std::string fileName)
{
    int fd;
    // ファイルをオープン
    fd = open(fileName.c_str(),O_RDWR);
    if(fd == -1)
    {
        std::cerr << \"Failed to open \" << fileName << std::endl;
        return -1;
    }

    // ファイル状態構造体を取得して、サイズを返す
    struct stat fileStat;
    fstat(fd,&fileStat);
    
    return fileStat.st_size;
}

/*
 * ファイル情報を書込.
 * ファイルID,ファイルサイズ、ファイルCRCをレジスタに書き込む
 *
 * @param[in] HostIFのインスタンスのポインタ
 * @param[in] ファイルID
 * @param[in] ファイルサイズ
 * @param[in] ファイルCRC
 */
void
UpdataEncFW::writeFileInfo(HostIF* encBoard,int fileID,int fileSize)
{
    // メモリ書き換え機能でUPDATE_FILE_IDにfileIDを書き込む
    encBoard->write(Fpga4K120PEncReg::BLOCK_MAIN,
            Fpga4K120PEncReg::FILE_INDENTIFICATION,
            ENC_UPDATA_DATA_SIZE,
            (unsigned int*)&fileID);
    
    // メモリ書き換え機能でUPDATE_FILE_SIZEにfileSizeを書き込む
    encBoard->write(Fpga4K120PEncReg::BLOCK_MAIN,
            Fpga4K120PEncReg::FILE_SIZE,
            ENC_UPDATA_DATA_SIZE,
            (unsigned int*)&fileSize);

    return;
}
/*
 * データバッファに書込.
 * UpdataEncFWインスタンスからバッファに書き込む
 * あわせてファイルポインタを設定
 *
 * @param[in] UpdataEncFWインスタンス
 * @param[out] ファイル内容のバッファ 
 *
 * @return ファイルサイズ
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
 * 指定アドレスへ書込.
 * 指定したアドレスにデータ書き込みを行う
 *
 * @param[in] HostIFインスタンスのポインタ
 * @param[in] 書き込み指定アドレス
 * @param[in] 書き込みデータ
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
 * バンクメモリ書込.
 * バンクｎに６４KBの書き込みを行う
 *
 * @param[in] HostIFインスタンスのポインタ
 * @param[in] バッファ（先頭位置を指定済み）
 *
 */
void
UpdataEncFW::writeMemArea(HostIF* encBoard,char* writeBuffer)
{
    //for debug
    printf(\"Enter UpdataEncFW::writeMemArea\\n\");
    
    encBoard->write(Fpga4K120PEncReg::BLOCK_MAIN,
            ENC_BANK_ADR, // BANK先頭アドレスがわかったら変更
            ENC_MEM_AREA_SIZE,
            (unsigned int *)writeBuffer);
    return;
}

/*
 * バンクメモリ切替.
 * バンクメモリ切り替えを行う
 *
 * @param[in] HostIFインスタンスのポインタ
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
