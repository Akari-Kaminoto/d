
((digest . "5e8626323a282c3871eb046bdb430c1b") (undo-list nil ("r" . -3524) ((marker . 3524) . -1) ((marker . 3524) . -1) ((marker . 3524) . -1) ((marker . 3524) . -1) ((marker . 3524) . -1) ("r" . -3525) ((marker . 3524) . -1) ((marker . 3524) . -1) ((marker . 3524) . -1) ((marker . 3524) . -1) 3526 nil ("E" . -3526) ((marker . 3524) . -1) ((marker . 3524) . -1) 3527 nil (3526 . 3527) (t 23503 57555 814167 384000) nil (3524 . 3526) (t 23502 54850 212263 612000) nil ("n" . 6987) 2524 (t 23502 54601 628263 612000) nil (6987 . 6988) (t 23502 49913 516263 612000) nil (2685 . 11323) ("--*/
# /* adx_connect用Project Top Folder Path */
# /*--------------------------------------*/
TOP_DIR_CONN  := $(shell cd ${MAKE_DIR}/../../.. ; pwd)
TOP_DIR_DATA  := ${TOP_DIR_CONN}/adx_connect/appfw_data
TOP_DIR_RECV  := ${TOP_DIR_CONN}/adx_connect/appfw_recv
TOP_DIR_SEND  := ${TOP_DIR_CONN}/adx_connect/appfw_send
TOP_DIR_TEST  := ${TOP_DIR_CONN}/adx_connect/appfw_test

# /*------------------------------------*/
# /* Component List File                */
# /*------------------------------------*/
COMP_LIST_FILE := ${TOP_DIR}/mng/comp_list.txt


# /* SILS用 Component List File         */
COMP_LIST_FILE_SOC1 := ${TOP_DIR}/mng/comp_list_soc1.txt
COMP_LIST_FILE_SOC2 := ${TOP_DIR}/mng/comp_list_soc2.txt
COMP_LIST_FILE_MCU1 := ${TOP_DIR}/mng/comp_list_mcu1.txt
COMP_LIST_FILE_MCU2 := ${TOP_DIR}/mng/comp_list_mcu2.txt

# /* adx_connect用 Component List File         */
COMP_LIST_FILE_DATA := ${TOP_DIR}/mng/comp_list_data.txt
COMP_LIST_FILE_RECV := ${TOP_DIR}/mng/comp_list_recv.txt
COMP_LIST_FILE_SEND := ${TOP_DIR}/mng/comp_list_send.txt
COMP_LIST_FILE_TEST := ${TOP_DIR}/mng/comp_list_test.txt

# /*------------------------------------*/
# /* Section 設定ファイル               */
# /*------------------------------------*/
SECTION_TEMPLATE := ${MAKE_DIR}/INTEGRITY_template.ld
SECTIONFILE      := ${TOP_DIR}/mng/INTEGRITY.ld
PT_CONFIG        := ${TOP_DIR}/mng/pt_config.txt

# /*------------------------------------*/
# /* Mng Path                           */
# /*------------------------------------*/
MNG_DIR  := ${TOP_DIR}/mng


# /*------------------------------------*/
# /* Releaseプロジェクト名定義ファイル  */
# /*------------------------------------*/
REL_DEF_FILE := ${TOP_DIR}/ecu/ecu_id.h

# /***************************************************************************/
# /* 出力ファイル(Path) Config                                               */
# /***************************************************************************/
# /*------------------------------------*/
# /* Object Path                        */
# /*------------------------------------*/
OBJ_DIR  := ${TOP_DIR}/_obj

# /*------------------------------------*/
# /* Release File Path                  */
# /*------------------------------------*/
REL_DIR  := ${TOP_DIR}/_release

# /*------------------------------------*/
# /* Source Delete Temporary Path       */
# /*------------------------------------*/
TMP_DEL_DIR := ${TOP_DIR}/_tmp_del

# /*------------------------------------*/
# /* Command Log File                   */
# /*------------------------------------*/
CMD_LOG_ALL  := ${OBJ_DIR}/all_cmd.log

# /*------------------------------------*/
# /* Error Log File                     */
# /*------------------------------------*/
ALL_ERR_LIST := ${OBJ_DIR}/all_err.log

# /*------------------------------------*/
# /* 秀丸 Jump Taglist                  */
# /*------------------------------------*/
HIDE_ERR_LIST := ${OBJ_DIR}/errlist_tagjump.txt

# /*------------------------------------*/
# /* Release Infomation File Name       */
# /*------------------------------------*/
REL_INFO := _release_info.txt

# /***************************************************************************/
# /* Define                                                                  */
# /***************************************************************************/
# /*------------------------------------*/
# /* プロジェクト名                     */
# /*------------------------------------*/
PROJECT := scheduler
# /*------------------------------------*/
# /* com(FFTW)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
FFTW_PACK    := com/fftw3
else
#FFTW_PACK    := com/mingw/fftw3
FFTW_PACK    := com/fftw3
endif
FFTW_LIB_DIR := ${TOP_DIR}/${FFTW_PACK}/lib
FFTW_INC_DIR := ${TOP_DIR}/${FFTW_PACK}/include

# /*------------------------------------*/
# /* com(OPENCV)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
OPENCV_PACK    := com/opencv
else
#OPENCV_PACK    := com/mingw/opencv
OPENCV_PACK    := com/opencv
endif
OPENCV_LIB_DIR := ${TOP_DIR}/${OPENCV_PACK}/lib
OPENCV_INC_DIR := ${TOP_DIR}/${OPENCV_PACK}/include

# /*------------------------------------*/
# /* com(IPOPT)                         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
IPOPT_PACK    := com/ipopt
else
#IPOPT_PACK    := com/mingw/ipopt
IPOPT_PACK    := com/ipopt
endif
IPOPT_LIB_DIR := ${TOP_DIR}/${IPOPT_PACK}/lib
IPOPT_INC_DIR := ${TOP_DIR}/${IPOPT_PACK}/include \\
                 ${TOP_DIR}/${IPOPT_PACK}/include/coin

# /*------------------------------------*/
# /* com(NCL)                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
NCL_PACK    := com/ncl
else
NCL_PACK    := com/ncl
endif
NCL_LIB_DIR := ${OBJ_DIR}/${NCL_PACK}
NCL_INC_DIR := ${TOP_DIR}/${NCL_PACK}

# /*------------------------------------*/
# /* com(gaudi/mdf4lib)                 */
# /*------------------------------------*/
ifeq ($(MINGW_SIM), 1)
GAUDI_PACK    := com/gaudi
GAUDI_LIB_DIR := ${TOP_DIR}/${GAUDI_PACK}/lib
MDF4_PACK			:= com/mdf4lib
MDF4_LIB_DIR 	:= ${TOP_DIR}/${MDF4_PACK}/lib
endif

# /*------------------------------------*/
# /* rapid_sils(rapid lib)                */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
RAPID_LIB_DIR := ../../../rapid_lib/obj
endif

# /*------------------------------------*/
# /* rapid_sils(can)                    */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
CAN_LIB_DIR := /usr/lib
CAN_INC_DIR := /usr/include
endif

# /*------------------------------------*/
# /* rapid_sils(hjson)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
HJSON_LIB_DIR := ../../../external/hjson-cpp/linux_x64
endif

# /*------------------------------------*/
# /* rapid_sils(bson)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
BSON_LIB_DIR := ../../../external/bson-cxx/linux_x64
endif

# /*------------------------------------*/
# /* rapid_sils(zstd)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
ZSTD_LIB_DIR := ../../../external/zstd/linux_x64
endif


# /*------------------------------------*/
# /* Compiler Include Root Path         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
INCLUDE_ROOT	:= \\
				$(OS_DIR)/modules/renesas/driver/iccom			\\
				$(OS_DIR)/modules/ghs/bspsrc					\\
				$(OS_DIR)/modules/ghs/bspsrc/support			\\
				$(OS_DIR)/asp/arm64/INTEGRITY-include			\\
				$(OS_DIR)/INTEGRITY-include 					\\
				$(OS_DIR)/kernel								\\
				$(OS_DIR)/intlib								\\
				$(OS_DIR)										\\
				tgt 											\\
				${TOP_DIR}										\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\

else
INCLUDE_ROOT	:= \\
				${TOP_DIR}/mingw_sim								\\
				${TOP_DIR}									\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\
				$(TOP_DIR)/bsw/inc								\\
				$(TOP_DIR)/bsw/exclude/inc							\\
				${TOP_DIR_SILS}									\\
#?			${TOP_DIR_SILS}/sils/common									\\
#				${TOP_DIR}/mingw_sim/dummy_include						\\

ifeq ($(RAPID_SILS), 1)
INCLUDE_ROOT += $(CAN_INC_DIR)
endif


# /* SILS用ECU固有 Include Root Path	*/
INCLUDE_ROOT_SOC1	:= \\
				${TOP_DIR_SOC1}										\\
				$(TOP_DIR_SOC1)/mcucom								\\
				$(TOP_DIR_SOC1)/ecu									\\
				$(TOP_DIR_SOC1)/bsw/inc								\\
				$(TOP_DIR_SOC1)/common					\\					


INCLUDE_ROOT_SOC2	:= \\
				${TOP_DIR_SOC2}										\\
				$(TOP_DIR_SOC2)/mcucom								\\
				$(TOP_DIR_SOC2)/ecu									\\
				$(TOP_DIR_SOC2)/bsw/inc								\\
				$(TOP_DIR_SOC2)/common					\\					

INCLUDE_ROOT_MCU1	:= \\
				${TOP_DIR_MCU1}										\\
				$(TOP_DIR_MCU1)/mcucom								\\
				$(TOP_DIR_MCU1)/ecu									\\
				$(TOP_DIR_MCU1)/bsw/inc								\\
				$(TOP_DIR_MCU1)/common					\\	

INCLUDE_ROOT_MCU2	:= \\
				${TOP_DIR_MCU2}										\\
				$(TOP_DIR_MCU2)/mcucom								\\
				$(TOP_DIR_MCU2)/ecu									\\
				$(TOP_DIR_MCU2)/bsw/inc								\\
				$(TOP_DIR_MCU2)/common					\\	

endif


# /*------------------------------------*/
# /* Link lib                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a		\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\

else
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv_calib3d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_features2d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_flann.a				\\
	$(OPENCV_LIB_DIR)/libopencv_highgui.a			\\
	$(OPENCV_LIB_DIR)/libopencv_imgproc.a			\\
	$(OPENCV_LIB_DIR)/libopencv_core.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a			\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\
	$(IPOPT_LIB_DIR)/libcoinmumps.a							\\
	$(IPOPT_LIB_DIR)/libcoinmetis.a						\\
	$(IPOPT_LIB_DIR)/libopenblas_haswell-r0.2.18.a	\\
	$(GAUDI_LIB_DIR)/libConvert.a \\
	$(GAUDI_LIB_DIR)/libFileIO.a \\
	$(GAUDI_LIB_DIR)/libGaudiCore.a \\
	$(GAUDI_LIB_DIR)/libGaudiData.a \\
	$(GAUDI_LIB_DIR)/libboost_regex.a \\
	$(MDF4_LIB_DIR)/libMF4Lib_SO_x86_mt.a \\
	$(GAUDI_LIB_DIR)/libPlugin.a \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc2.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu2.a  \\
#	$(FFTW_LIB_DIR)/libfftw3-3.lib.a						\\
#	$(FFTW_LIB_DIR)/libfftw3f-3.lib.a						\\
#	$(OPENCV_LIB_DIR)/libopencv_calib3d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_core249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_features2d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_flann249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_highgui249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_imgproc249.dll.a			\\
#	$(IPOPT_LIB_DIR)/libIpOptFSS.a							\\
#	$(IPOPT_LIB_DIR)/libIpOpt-vc10.a						\\
#	$(IPOPT_LIB_DIR)/liblanekeep_pathoptimizer_Bspline.a	\\

ifeq ($(RAPID_SILS), 1)
LIBS += $(RAPID_LIB_DIR)/libbsw.a\\
				$(RAPID_LIB_DIR)/libdumper.a\\
				$(RAPID_LIB_DIR)/libslog.a\\
				$(RAPID_LIB_DIR)/libsys.a\\
				$(BSON_LIB_DIR)/libbson-cxx.ubuntu16.04.a\\
				$(HJSON_LIB_DIR)/libhjson.ubuntu16.04.a\\
				$(ZSTD_LIB_DIR)/libzstd.ubuntu16.04.a\\
				$(CAN_LIB_DIR)/libcanlib.so
endif" . 2685) (t 23502 49827 352263 612000) nil (2685 . 13501) ("*/
# /* Component List File                */
# /*------------------------------------*/
COMP_LIST_FILE := ${TOP_DIR}/mng/comp_list.txt


# /* SILS用 Component List File         */
COMP_LIST_FILE_SOC1 := ${TOP_DIR}/mng/comp_list_soc1.txt
COMP_LIST_FILE_SOC2 := ${TOP_DIR}/mng/comp_list_soc2.txt
COMP_LIST_FILE_MCU1 := ${TOP_DIR}/mng/comp_list_mcu1.txt
COMP_LIST_FILE_MCU2 := ${TOP_DIR}/mng/comp_list_mcu2.txt

# /*------------------------------------*/
# /* Section 設定ファイル               */
# /*------------------------------------*/
SECTION_TEMPLATE := ${MAKE_DIR}/INTEGRITY_template.ld
SECTIONFILE      := ${TOP_DIR}/mng/INTEGRITY.ld
PT_CONFIG        := ${TOP_DIR}/mng/pt_config.txt

# /*------------------------------------*/
# /* Mng Path                           */
# /*------------------------------------*/
MNG_DIR  := ${TOP_DIR}/mng


# /*------------------------------------*/
# /* Releaseプロジェクト名定義ファイル  */
# /*------------------------------------*/
REL_DEF_FILE := ${TOP_DIR}/ecu/ecu_id.h

# /***************************************************************************/
# /* 出力ファイル(Path) Config                                               */
# /***************************************************************************/
# /*------------------------------------*/
# /* Object Path                        */
# /*------------------------------------*/
OBJ_DIR  := ${TOP_DIR}/_obj

# /*------------------------------------*/
# /* Release File Path                  */
# /*------------------------------------*/
REL_DIR  := ${TOP_DIR}/_release

# /*------------------------------------*/
# /* Source Delete Temporary Path       */
# /*------------------------------------*/
TMP_DEL_DIR := ${TOP_DIR}/_tmp_del

# /*------------------------------------*/
# /* Command Log File                   */
# /*------------------------------------*/
CMD_LOG_ALL  := ${OBJ_DIR}/all_cmd.log

# /*------------------------------------*/
# /* Error Log File                     */
# /*------------------------------------*/
ALL_ERR_LIST := ${OBJ_DIR}/all_err.log

# /*------------------------------------*/
# /* 秀丸 Jump Taglist                  */
# /*------------------------------------*/
HIDE_ERR_LIST := ${OBJ_DIR}/errlist_tagjump.txt

# /*------------------------------------*/
# /* Release Infomation File Name       */
# /*------------------------------------*/
REL_INFO := _release_info.txt

# /***************************************************************************/
# /* Define                                                                  */
# /***************************************************************************/
# /*------------------------------------*/
# /* プロジェクト名                     */
# /*------------------------------------*/
PROJECT := scheduler
# /*------------------------------------*/
# /* com(FFTW)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
FFTW_PACK    := com/fftw3
else
#FFTW_PACK    := com/mingw/fftw3
FFTW_PACK    := com/fftw3
endif
FFTW_LIB_DIR := ${TOP_DIR}/${FFTW_PACK}/lib
FFTW_INC_DIR := ${TOP_DIR}/${FFTW_PACK}/include

# /*------------------------------------*/
# /* com(OPENCV)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
OPENCV_PACK    := com/opencv
else
#OPENCV_PACK    := com/mingw/opencv
OPENCV_PACK    := com/opencv
endif
OPENCV_LIB_DIR := ${TOP_DIR}/${OPENCV_PACK}/lib
OPENCV_INC_DIR := ${TOP_DIR}/${OPENCV_PACK}/include

# /*------------------------------------*/
# /* com(IPOPT)                         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
IPOPT_PACK    := com/ipopt
else
#IPOPT_PACK    := com/mingw/ipopt
IPOPT_PACK    := com/ipopt
endif
IPOPT_LIB_DIR := ${TOP_DIR}/${IPOPT_PACK}/lib
IPOPT_INC_DIR := ${TOP_DIR}/${IPOPT_PACK}/include \\
                 ${TOP_DIR}/${IPOPT_PACK}/include/coin

# /*------------------------------------*/
# /* com(NCL)                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
NCL_PACK    := com/ncl
else
NCL_PACK    := com/ncl
endif
NCL_LIB_DIR := ${OBJ_DIR}/${NCL_PACK}
NCL_INC_DIR := ${TOP_DIR}/${NCL_PACK}

# /*------------------------------------*/
# /* com(gaudi/mdf4lib)                 */
# /*------------------------------------*/
ifeq ($(MINGW_SIM), 1)
GAUDI_PACK    := com/gaudi
GAUDI_LIB_DIR := ${TOP_DIR}/${GAUDI_PACK}/lib
MDF4_PACK			:= com/mdf4lib
MDF4_LIB_DIR 	:= ${TOP_DIR}/${MDF4_PACK}/lib
endif


# /*------------------------------------*/
# /* Compiler Include Root Path         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
INCLUDE_ROOT	:= \\
				$(OS_DIR)/modules/renesas/driver/iccom			\\
				$(OS_DIR)/modules/ghs/bspsrc					\\
				$(OS_DIR)/modules/ghs/bspsrc/support			\\
				$(OS_DIR)/asp/arm64/INTEGRITY-include			\\
				$(OS_DIR)/INTEGRITY-include 					\\
				$(OS_DIR)/kernel								\\
				$(OS_DIR)/intlib								\\
				$(OS_DIR)										\\
				tgt 											\\
				${TOP_DIR}										\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\

else
INCLUDE_ROOT	:= \\
				${TOP_DIR}/mingw_sim								\\
				${TOP_DIR}									\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\
				$(TOP_DIR)/bsw/inc								\\
				$(TOP_DIR)/bsw/exclude/inc							\\
				${TOP_DIR_SILS}									\\
#				${TOP_DIR}/mingw_sim/dummy_include						\\

# /* SILS用ECU固有 Include Root Path	*/
INCLUDE_ROOT_SOC1	:= \\
				${TOP_DIR_SOC1}										\\
				$(TOP_DIR_SOC1)/mcucom								\\
				$(TOP_DIR_SOC1)/ecu									\\
				$(TOP_DIR_SOC1)/bsw/inc								\\
				$(TOP_DIR_SOC1)/common					\\					


INCLUDE_ROOT_SOC2	:= \\
				${TOP_DIR_SOC2}										\\
				$(TOP_DIR_SOC2)/mcucom								\\
				$(TOP_DIR_SOC2)/ecu									\\
				$(TOP_DIR_SOC2)/bsw/inc								\\
				$(TOP_DIR_SOC2)/common					\\					

INCLUDE_ROOT_MCU1	:= \\
				${TOP_DIR_MCU1}										\\
				$(TOP_DIR_MCU1)/mcucom								\\
				$(TOP_DIR_MCU1)/ecu									\\
				$(TOP_DIR_MCU1)/bsw/inc								\\
				$(TOP_DIR_MCU1)/common					\\	

INCLUDE_ROOT_MCU2	:= \\
				${TOP_DIR_MCU2}										\\
				$(TOP_DIR_MCU2)/mcucom								\\
				$(TOP_DIR_MCU2)/ecu									\\
				$(TOP_DIR_MCU2)/bsw/inc								\\
				$(TOP_DIR_MCU2)/common					\\	

endif


# /*------------------------------------*/
# /* Link lib                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a		\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\

else
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv_calib3d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_features2d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_flann.a				\\
	$(OPENCV_LIB_DIR)/libopencv_highgui.a			\\
	$(OPENCV_LIB_DIR)/libopencv_imgproc.a			\\
	$(OPENCV_LIB_DIR)/libopencv_core.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a			\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\
	$(IPOPT_LIB_DIR)/libcoinmumps.a							\\
	$(IPOPT_LIB_DIR)/libcoinmetis.a						\\
	$(IPOPT_LIB_DIR)/libopenblas_haswell-r0.2.18.a	\\
	$(GAUDI_LIB_DIR)/libConvert.a \\
	$(GAUDI_LIB_DIR)/libFileIO.a \\
	$(GAUDI_LIB_DIR)/libGaudiCore.a \\
	$(GAUDI_LIB_DIR)/libGaudiData.a \\
	$(GAUDI_LIB_DIR)/libboost_regex.a \\
	$(MDF4_LIB_DIR)/libMF4Lib_SO_x86_mt.a \\
	$(GAUDI_LIB_DIR)/libPlugin.a \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc2.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu2.a  \\
#	$(FFTW_LIB_DIR)/libfftw3-3.lib.a						\\
#	$(FFTW_LIB_DIR)/libfftw3f-3.lib.a						\\
#	$(OPENCV_LIB_DIR)/libopencv_calib3d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_core249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_features2d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_flann249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_highgui249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_imgproc249.dll.a			\\
#	$(IPOPT_LIB_DIR)/libIpOptFSS.a							\\
#	$(IPOPT_LIB_DIR)/libIpOpt-vc10.a						\\
#	$(IPOPT_LIB_DIR)/liblanekeep_pathoptimizer_Bspline.a	\\" . 2685) (t 23502 35712 814817 268000) nil (2685 . 11323) ("--*/
# /* adx_connect用Project Top Folder Path */
# /*--------------------------------------*/
TOP_DIR_CONN  := $(shell cd ${MAKE_DIR}/../../.. ; pwd)
TOP_DIR_DATA  := ${TOP_DIR_CONN}/adx_connect/appfw_data
TOP_DIR_RECV  := ${TOP_DIR_CONN}/adx_connect/appfw_recv
TOP_DIR_SEND  := ${TOP_DIR_CONN}/adx_connect/appfw_send
TOP_DIR_TEST  := ${TOP_DIR_CONN}/adx_connect/appfw_test

# /*------------------------------------*/
# /* Component List File                */
# /*------------------------------------*/
COMP_LIST_FILE := ${TOP_DIR}/mng/comp_list.txt


# /* SILS用 Component List File         */
COMP_LIST_FILE_SOC1 := ${TOP_DIR}/mng/comp_list_soc1.txt
COMP_LIST_FILE_SOC2 := ${TOP_DIR}/mng/comp_list_soc2.txt
COMP_LIST_FILE_MCU1 := ${TOP_DIR}/mng/comp_list_mcu1.txt
COMP_LIST_FILE_MCU2 := ${TOP_DIR}/mng/comp_list_mcu2.txt

# /* adx_connect用 Component List File         */
COMP_LIST_FILE_DATA := ${TOP_DIR}/mng/comp_list_data.txt
COMP_LIST_FILE_RECV := ${TOP_DIR}/mng/comp_list_recv.txt
COMP_LIST_FILE_SEND := ${TOP_DIR}/mng/comp_list_send.txt
COMP_LIST_FILE_TEST := ${TOP_DIR}/mng/comp_list_test.txt

# /*------------------------------------*/
# /* Section 設定ファイル               */
# /*------------------------------------*/
SECTION_TEMPLATE := ${MAKE_DIR}/INTEGRITY_template.ld
SECTIONFILE      := ${TOP_DIR}/mng/INTEGRITY.ld
PT_CONFIG        := ${TOP_DIR}/mng/pt_config.txt

# /*------------------------------------*/
# /* Mng Path                           */
# /*------------------------------------*/
MNG_DIR  := ${TOP_DIR}/mng


# /*------------------------------------*/
# /* Releaseプロジェクト名定義ファイル  */
# /*------------------------------------*/
REL_DEF_FILE := ${TOP_DIR}/ecu/ecu_id.h

# /***************************************************************************/
# /* 出力ファイル(Path) Config                                               */
# /***************************************************************************/
# /*------------------------------------*/
# /* Object Path                        */
# /*------------------------------------*/
OBJ_DIR  := ${TOP_DIR}/_obj

# /*------------------------------------*/
# /* Release File Path                  */
# /*------------------------------------*/
REL_DIR  := ${TOP_DIR}/_release

# /*------------------------------------*/
# /* Source Delete Temporary Path       */
# /*------------------------------------*/
TMP_DEL_DIR := ${TOP_DIR}/_tmp_del

# /*------------------------------------*/
# /* Command Log File                   */
# /*------------------------------------*/
CMD_LOG_ALL  := ${OBJ_DIR}/all_cmd.log

# /*------------------------------------*/
# /* Error Log File                     */
# /*------------------------------------*/
ALL_ERR_LIST := ${OBJ_DIR}/all_err.log

# /*------------------------------------*/
# /* 秀丸 Jump Taglist                  */
# /*------------------------------------*/
HIDE_ERR_LIST := ${OBJ_DIR}/errlist_tagjump.txt

# /*------------------------------------*/
# /* Release Infomation File Name       */
# /*------------------------------------*/
REL_INFO := _release_info.txt

# /***************************************************************************/
# /* Define                                                                  */
# /***************************************************************************/
# /*------------------------------------*/
# /* プロジェクト名                     */
# /*------------------------------------*/
PROJECT := scheduler
# /*------------------------------------*/
# /* com(FFTW)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
FFTW_PACK    := com/fftw3
else
#FFTW_PACK    := com/mingw/fftw3
FFTW_PACK    := com/fftw3
endif
FFTW_LIB_DIR := ${TOP_DIR}/${FFTW_PACK}/lib
FFTW_INC_DIR := ${TOP_DIR}/${FFTW_PACK}/include

# /*------------------------------------*/
# /* com(OPENCV)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
OPENCV_PACK    := com/opencv
else
#OPENCV_PACK    := com/mingw/opencv
OPENCV_PACK    := com/opencv
endif
OPENCV_LIB_DIR := ${TOP_DIR}/${OPENCV_PACK}/lib
OPENCV_INC_DIR := ${TOP_DIR}/${OPENCV_PACK}/include

# /*------------------------------------*/
# /* com(IPOPT)                         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
IPOPT_PACK    := com/ipopt
else
#IPOPT_PACK    := com/mingw/ipopt
IPOPT_PACK    := com/ipopt
endif
IPOPT_LIB_DIR := ${TOP_DIR}/${IPOPT_PACK}/lib
IPOPT_INC_DIR := ${TOP_DIR}/${IPOPT_PACK}/include \\
                 ${TOP_DIR}/${IPOPT_PACK}/include/coin

# /*------------------------------------*/
# /* com(NCL)                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
NCL_PACK    := com/ncl
else
NCL_PACK    := com/ncl
endif
NCL_LIB_DIR := ${OBJ_DIR}/${NCL_PACK}
NCL_INC_DIR := ${TOP_DIR}/${NCL_PACK}

# /*------------------------------------*/
# /* com(gaudi/mdf4lib)                 */
# /*------------------------------------*/
ifeq ($(MINGW_SIM), 1)
GAUDI_PACK    := com/gaudi
GAUDI_LIB_DIR := ${TOP_DIR}/${GAUDI_PACK}/lib
MDF4_PACK			:= com/mdf4lib
MDF4_LIB_DIR 	:= ${TOP_DIR}/${MDF4_PACK}/lib
endif

# /*------------------------------------*/
# /* rapid_sils(rapid lib)                */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
RAPID_LIB_DIR := ../../../rapid_lib/obj
endif

# /*------------------------------------*/
# /* rapid_sils(can)                    */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
CAN_LIB_DIR := /usr/lib
CAN_INC_DIR := /usr/include
endif

# /*------------------------------------*/
# /* rapid_sils(hjson)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
HJSON_LIB_DIR := ../../../external/hjson-cpp/linux_x64
endif

# /*------------------------------------*/
# /* rapid_sils(bson)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
BSON_LIB_DIR := ../../../external/bson-cxx/linux_x64
endif

# /*------------------------------------*/
# /* rapid_sils(zstd)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
ZSTD_LIB_DIR := ../../../external/zstd/linux_x64
endif


# /*------------------------------------*/
# /* Compiler Include Root Path         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
INCLUDE_ROOT	:= \\
				$(OS_DIR)/modules/renesas/driver/iccom			\\
				$(OS_DIR)/modules/ghs/bspsrc					\\
				$(OS_DIR)/modules/ghs/bspsrc/support			\\
				$(OS_DIR)/asp/arm64/INTEGRITY-include			\\
				$(OS_DIR)/INTEGRITY-include 					\\
				$(OS_DIR)/kernel								\\
				$(OS_DIR)/intlib								\\
				$(OS_DIR)										\\
				tgt 											\\
				${TOP_DIR}										\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\

else
INCLUDE_ROOT	:= \\
				${TOP_DIR}/mingw_sim								\\
				${TOP_DIR}									\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\
				$(TOP_DIR)/bsw/inc								\\
				$(TOP_DIR)/bsw/exclude/inc							\\
				${TOP_DIR_SILS}									\\
#?			${TOP_DIR_SILS}/sils/common									\\
#				${TOP_DIR}/mingw_sim/dummy_include						\\

ifeq ($(RAPID_SILS), 1)
INCLUDE_ROOT += $(CAN_INC_DIR)
endif


# /* SILS用ECU固有 Include Root Path	*/
INCLUDE_ROOT_SOC1	:= \\
				${TOP_DIR_SOC1}										\\
				$(TOP_DIR_SOC1)/mcucom								\\
				$(TOP_DIR_SOC1)/ecu									\\
				$(TOP_DIR_SOC1)/bsw/inc								\\
				$(TOP_DIR_SOC1)/common					\\					


INCLUDE_ROOT_SOC2	:= \\
				${TOP_DIR_SOC2}										\\
				$(TOP_DIR_SOC2)/mcucom								\\
				$(TOP_DIR_SOC2)/ecu									\\
				$(TOP_DIR_SOC2)/bsw/inc								\\
				$(TOP_DIR_SOC2)/common					\\					

INCLUDE_ROOT_MCU1	:= \\
				${TOP_DIR_MCU1}										\\
				$(TOP_DIR_MCU1)/mcucom								\\
				$(TOP_DIR_MCU1)/ecu									\\
				$(TOP_DIR_MCU1)/bsw/inc								\\
				$(TOP_DIR_MCU1)/common					\\	

INCLUDE_ROOT_MCU2	:= \\
				${TOP_DIR_MCU2}										\\
				$(TOP_DIR_MCU2)/mcucom								\\
				$(TOP_DIR_MCU2)/ecu									\\
				$(TOP_DIR_MCU2)/bsw/inc								\\
				$(TOP_DIR_MCU2)/common					\\	

endif


# /*------------------------------------*/
# /* Link lib                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a		\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\

else
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv_calib3d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_features2d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_flann.a				\\
	$(OPENCV_LIB_DIR)/libopencv_highgui.a			\\
	$(OPENCV_LIB_DIR)/libopencv_imgproc.a			\\
	$(OPENCV_LIB_DIR)/libopencv_core.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a			\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\
	$(IPOPT_LIB_DIR)/libcoinmumps.a							\\
	$(IPOPT_LIB_DIR)/libcoinmetis.a						\\
	$(IPOPT_LIB_DIR)/libopenblas_haswell-r0.2.18.a	\\
	$(GAUDI_LIB_DIR)/libConvert.a \\
	$(GAUDI_LIB_DIR)/libFileIO.a \\
	$(GAUDI_LIB_DIR)/libGaudiCore.a \\
	$(GAUDI_LIB_DIR)/libGaudiData.a \\
	$(GAUDI_LIB_DIR)/libboost_regex.a \\
	$(MDF4_LIB_DIR)/libMF4Lib_SO_x86_mt.a \\
	$(GAUDI_LIB_DIR)/libPlugin.a \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc2.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu2.a  \\
#	$(FFTW_LIB_DIR)/libfftw3-3.lib.a						\\
#	$(FFTW_LIB_DIR)/libfftw3f-3.lib.a						\\
#	$(OPENCV_LIB_DIR)/libopencv_calib3d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_core249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_features2d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_flann249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_highgui249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_imgproc249.dll.a			\\
#	$(IPOPT_LIB_DIR)/libIpOptFSS.a							\\
#	$(IPOPT_LIB_DIR)/libIpOpt-vc10.a						\\
#	$(IPOPT_LIB_DIR)/liblanekeep_pathoptimizer_Bspline.a	\\

ifeq ($(RAPID_SILS), 1)
LIBS += $(RAPID_LIB_DIR)/libbsw.a\\
				$(RAPID_LIB_DIR)/libdumper.a\\
				$(RAPID_LIB_DIR)/libslog.a\\
				$(RAPID_LIB_DIR)/libsys.a\\
				$(BSON_LIB_DIR)/libbson-cxx.ubuntu16.04.a\\
				$(HJSON_LIB_DIR)/libhjson.ubuntu16.04.a\\
				$(ZSTD_LIB_DIR)/libzstd.ubuntu16.04.a\\
				$(CAN_LIB_DIR)/libcanlib.so
endif" . 2685) (t 23502 35673 374817 268000) nil (2685 . 10436) ("*/
# /* Component List File                */
# /*------------------------------------*/
COMP_LIST_FILE := ${TOP_DIR}/mng/comp_list.txt


# /* SILS用 Component List File         */
COMP_LIST_FILE_SOC1 := ${TOP_DIR}/mng/comp_list_soc1.txt
COMP_LIST_FILE_SOC2 := ${TOP_DIR}/mng/comp_list_soc2.txt
COMP_LIST_FILE_MCU1 := ${TOP_DIR}/mng/comp_list_mcu1.txt
COMP_LIST_FILE_MCU2 := ${TOP_DIR}/mng/comp_list_mcu2.txt

# /*------------------------------------*/
# /* Section 設定ファイル               */
# /*------------------------------------*/
SECTION_TEMPLATE := ${MAKE_DIR}/INTEGRITY_template.ld
SECTIONFILE      := ${TOP_DIR}/mng/INTEGRITY.ld
PT_CONFIG        := ${TOP_DIR}/mng/pt_config.txt

# /*------------------------------------*/
# /* Mng Path                           */
# /*------------------------------------*/
MNG_DIR  := ${TOP_DIR}/mng


# /*------------------------------------*/
# /* Releaseプロジェクト名定義ファイル  */
# /*------------------------------------*/
REL_DEF_FILE := ${TOP_DIR}/ecu/ecu_id.h

# /***************************************************************************/
# /* 出力ファイル(Path) Config                                               */
# /***************************************************************************/
# /*------------------------------------*/
# /* Object Path                        */
# /*------------------------------------*/
OBJ_DIR  := ${TOP_DIR}/_obj

# /*------------------------------------*/
# /* Release File Path                  */
# /*------------------------------------*/
REL_DIR  := ${TOP_DIR}/_release

# /*------------------------------------*/
# /* Source Delete Temporary Path       */
# /*------------------------------------*/
TMP_DEL_DIR := ${TOP_DIR}/_tmp_del

# /*------------------------------------*/
# /* Command Log File                   */
# /*------------------------------------*/
CMD_LOG_ALL  := ${OBJ_DIR}/all_cmd.log

# /*------------------------------------*/
# /* Error Log File                     */
# /*------------------------------------*/
ALL_ERR_LIST := ${OBJ_DIR}/all_err.log

# /*------------------------------------*/
# /* 秀丸 Jump Taglist                  */
# /*------------------------------------*/
HIDE_ERR_LIST := ${OBJ_DIR}/errlist_tagjump.txt

# /*------------------------------------*/
# /* Release Infomation File Name       */
# /*------------------------------------*/
REL_INFO := _release_info.txt

# /***************************************************************************/
# /* Define                                                                  */
# /***************************************************************************/
# /*------------------------------------*/
# /* プロジェクト名                     */
# /*------------------------------------*/
PROJECT := scheduler
# /*------------------------------------*/
# /* com(FFTW)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
FFTW_PACK    := com/fftw3
else
#FFTW_PACK    := com/mingw/fftw3
FFTW_PACK    := com/fftw3
endif
FFTW_LIB_DIR := ${TOP_DIR}/${FFTW_PACK}/lib
FFTW_INC_DIR := ${TOP_DIR}/${FFTW_PACK}/include

# /*------------------------------------*/
# /* com(OPENCV)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
OPENCV_PACK    := com/opencv
else
#OPENCV_PACK    := com/mingw/opencv
OPENCV_PACK    := com/opencv
endif
OPENCV_LIB_DIR := ${TOP_DIR}/${OPENCV_PACK}/lib
OPENCV_INC_DIR := ${TOP_DIR}/${OPENCV_PACK}/include

# /*------------------------------------*/
# /* com(IPOPT)                         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
IPOPT_PACK    := com/ipopt
else
#IPOPT_PACK    := com/mingw/ipopt
IPOPT_PACK    := com/ipopt
endif
IPOPT_LIB_DIR := ${TOP_DIR}/${IPOPT_PACK}/lib
IPOPT_INC_DIR := ${TOP_DIR}/${IPOPT_PACK}/include \\
                 ${TOP_DIR}/${IPOPT_PACK}/include/coin

# /*------------------------------------*/
# /* com(NCL)                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
NCL_PACK    := com/ncl
else
NCL_PACK    := com/ncl
endif
NCL_LIB_DIR := ${OBJ_DIR}/${NCL_PACK}
NCL_INC_DIR := ${TOP_DIR}/${NCL_PACK}

# /*------------------------------------*/
# /* com(gaudi/mdf4lib)                 */
# /*------------------------------------*/
ifeq ($(MINGW_SIM), 1)
GAUDI_PACK    := com/gaudi
GAUDI_LIB_DIR := ${TOP_DIR}/${GAUDI_PACK}/lib
MDF4_PACK			:= com/mdf4lib
MDF4_LIB_DIR 	:= ${TOP_DIR}/${MDF4_PACK}/lib
endif

# /*------------------------------------*/
# /* rapid_sils(rapid lib)                */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
RAPID_LIB_DIR := ../../../rapid_lib/obj
endif

# /*------------------------------------*/
# /* rapid_sils(can)                    */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
CAN_LIB_DIR := /usr/lib
CAN_INC_DIR := /usr/include
endif

# /*------------------------------------*/
# /* rapid_sils(hjson)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
HJSON_LIB_DIR := ../../../external/hjson-cpp/linux_x64
endif

# /*------------------------------------*/
# /* rapid_sils(bson)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
BSON_LIB_DIR := ../../../external/bson-cxx/linux_x64
endif

# /*------------------------------------*/
# /* rapid_sils(zstd)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
ZSTD_LIB_DIR := ../../../external/zstd/linux_x64
endif


# /*------------------------------------*/
# /* Compiler Include Root Path         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
INCLUDE_ROOT	:= \\
				$(OS_DIR)/modules/renesas/driver/iccom			\\
				$(OS_DIR)/modules/ghs/bspsrc					\\
				$(OS_DIR)/modules/ghs/bspsrc/support			\\
				$(OS_DIR)/asp/arm64/INTEGRITY-include			\\
				$(OS_DIR)/INTEGRITY-include 					\\
				$(OS_DIR)/kernel								\\
				$(OS_DIR)/intlib								\\
				$(OS_DIR)										\\
				tgt 											\\
				${TOP_DIR}										\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\

else
INCLUDE_ROOT	:= \\
				${TOP_DIR}/mingw_sim								\\
				${TOP_DIR}									\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\
				$(TOP_DIR)/bsw/inc								\\
				$(TOP_DIR)/bsw/exclude/inc							\\
				${TOP_DIR_SILS}" . 2685) 2524 (t 23502 35638 918817 268000) nil (7160 . 12765) ("
# /*------------------------------------*/
# /* Compiler Include Root Path         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
INCLUDE_ROOT	:= \\
				$(OS_DIR)/modules/renesas/driver/iccom			\\
				$(OS_DIR)/modules/ghs/bspsrc					\\
				$(OS_DIR)/modules/ghs/bspsrc/support			\\
				$(OS_DIR)/asp/arm64/INTEGRITY-include			\\
				$(OS_DIR)/INTEGRITY-include 					\\
				$(OS_DIR)/kernel								\\
				$(OS_DIR)/intlib								\\
				$(OS_DIR)										\\
				tgt 											\\
				${TOP_DIR}										\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\

else
INCLUDE_ROOT	:= \\
				${TOP_DIR}/mingw_sim								\\
				${TOP_DIR}									\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\
				$(TOP_DIR)/bsw/inc								\\
				$(TOP_DIR)/bsw/exclude/inc							\\
				${TOP_DIR_SILS}									\\
#				${TOP_DIR}/mingw_sim/dummy_include						\\

# /* SILS用ECU固有 Include Root Path	*/
INCLUDE_ROOT_SOC1	:= \\
				${TOP_DIR_SOC1}										\\
				$(TOP_DIR_SOC1)/mcucom								\\
				$(TOP_DIR_SOC1)/ecu									\\
				$(TOP_DIR_SOC1)/bsw/inc								\\
				$(TOP_DIR_SOC1)/common					\\					


INCLUDE_ROOT_SOC2	:= \\
				${TOP_DIR_SOC2}										\\
				$(TOP_DIR_SOC2)/mcucom								\\
				$(TOP_DIR_SOC2)/ecu									\\
				$(TOP_DIR_SOC2)/bsw/inc								\\
				$(TOP_DIR_SOC2)/common					\\					

INCLUDE_ROOT_MCU1	:= \\
				${TOP_DIR_MCU1}										\\
				$(TOP_DIR_MCU1)/mcucom								\\
				$(TOP_DIR_MCU1)/ecu									\\
				$(TOP_DIR_MCU1)/bsw/inc								\\
				$(TOP_DIR_MCU1)/common					\\	

INCLUDE_ROOT_MCU2	:= \\
				${TOP_DIR_MCU2}										\\
				$(TOP_DIR_MCU2)/mcucom								\\
				$(TOP_DIR_MCU2)/ecu									\\
				$(TOP_DIR_MCU2)/bsw/inc								\\
				$(TOP_DIR_MCU2)/common					\\	

endif


# /*------------------------------------*/
# /* Link lib                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a		\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\

else
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv_calib3d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_features2d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_flann.a				\\
	$(OPENCV_LIB_DIR)/libopencv_highgui.a			\\
	$(OPENCV_LIB_DIR)/libopencv_imgproc.a			\\
	$(OPENCV_LIB_DIR)/libopencv_core.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a			\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\
	$(IPOPT_LIB_DIR)/libcoinmumps.a							\\
	$(IPOPT_LIB_DIR)/libcoinmetis.a						\\
	$(IPOPT_LIB_DIR)/libopenblas_haswell-r0.2.18.a	\\
	$(GAUDI_LIB_DIR)/libConvert.a \\
	$(GAUDI_LIB_DIR)/libFileIO.a \\
	$(GAUDI_LIB_DIR)/libGaudiCore.a \\
	$(GAUDI_LIB_DIR)/libGaudiData.a \\
	$(GAUDI_LIB_DIR)/libboost_regex.a \\
	$(MDF4_LIB_DIR)/libMF4Lib_SO_x86_mt.a \\
	$(GAUDI_LIB_DIR)/libPlugin.a \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc2.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu2.a  \\
#	$(FFTW_LIB_DIR)/libfftw3-3.lib.a						\\
#	$(FFTW_LIB_DIR)/libfftw3f-3.lib.a						\\
#	$(OPENCV_LIB_DIR)/libopencv_calib3d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_core249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_features2d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_flann249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_highgui249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_imgproc249.dll.a			\\
#	$(IPOPT_LIB_DIR)/libIpOptFSS.a							\\
#	$(IPOPT_LIB_DIR)/libIpOpt-vc10.a						\\
#	$(IPOPT_LIB_DIR)/liblanekeep_pathoptimizer_Bspline.a	\\" . 7160) (t 23502 35454 274817 268000) nil (2685 . 11323) ("--*/
# /* adx_connect用Project Top Folder Path */
# /*--------------------------------------*/
TOP_DIR_CONN  := $(shell cd ${MAKE_DIR}/../../.. ; pwd)
TOP_DIR_DATA  := ${TOP_DIR_CONN}/adx_connect/appfw_data
TOP_DIR_RECV  := ${TOP_DIR_CONN}/adx_connect/appfw_recv
TOP_DIR_SEND  := ${TOP_DIR_CONN}/adx_connect/appfw_send
TOP_DIR_TEST  := ${TOP_DIR_CONN}/adx_connect/appfw_test

# /*------------------------------------*/
# /* Component List File                */
# /*------------------------------------*/
COMP_LIST_FILE := ${TOP_DIR}/mng/comp_list.txt


# /* SILS用 Component List File         */
COMP_LIST_FILE_SOC1 := ${TOP_DIR}/mng/comp_list_soc1.txt
COMP_LIST_FILE_SOC2 := ${TOP_DIR}/mng/comp_list_soc2.txt
COMP_LIST_FILE_MCU1 := ${TOP_DIR}/mng/comp_list_mcu1.txt
COMP_LIST_FILE_MCU2 := ${TOP_DIR}/mng/comp_list_mcu2.txt

# /* adx_connect用 Component List File         */
COMP_LIST_FILE_DATA := ${TOP_DIR}/mng/comp_list_data.txt
COMP_LIST_FILE_RECV := ${TOP_DIR}/mng/comp_list_recv.txt
COMP_LIST_FILE_SEND := ${TOP_DIR}/mng/comp_list_send.txt
COMP_LIST_FILE_TEST := ${TOP_DIR}/mng/comp_list_test.txt

# /*------------------------------------*/
# /* Section 設定ファイル               */
# /*------------------------------------*/
SECTION_TEMPLATE := ${MAKE_DIR}/INTEGRITY_template.ld
SECTIONFILE      := ${TOP_DIR}/mng/INTEGRITY.ld
PT_CONFIG        := ${TOP_DIR}/mng/pt_config.txt

# /*------------------------------------*/
# /* Mng Path                           */
# /*------------------------------------*/
MNG_DIR  := ${TOP_DIR}/mng


# /*------------------------------------*/
# /* Releaseプロジェクト名定義ファイル  */
# /*------------------------------------*/
REL_DEF_FILE := ${TOP_DIR}/ecu/ecu_id.h

# /***************************************************************************/
# /* 出力ファイル(Path) Config                                               */
# /***************************************************************************/
# /*------------------------------------*/
# /* Object Path                        */
# /*------------------------------------*/
OBJ_DIR  := ${TOP_DIR}/_obj

# /*------------------------------------*/
# /* Release File Path                  */
# /*------------------------------------*/
REL_DIR  := ${TOP_DIR}/_release

# /*------------------------------------*/
# /* Source Delete Temporary Path       */
# /*------------------------------------*/
TMP_DEL_DIR := ${TOP_DIR}/_tmp_del

# /*------------------------------------*/
# /* Command Log File                   */
# /*------------------------------------*/
CMD_LOG_ALL  := ${OBJ_DIR}/all_cmd.log

# /*------------------------------------*/
# /* Error Log File                     */
# /*------------------------------------*/
ALL_ERR_LIST := ${OBJ_DIR}/all_err.log

# /*------------------------------------*/
# /* 秀丸 Jump Taglist                  */
# /*------------------------------------*/
HIDE_ERR_LIST := ${OBJ_DIR}/errlist_tagjump.txt

# /*------------------------------------*/
# /* Release Infomation File Name       */
# /*------------------------------------*/
REL_INFO := _release_info.txt

# /***************************************************************************/
# /* Define                                                                  */
# /***************************************************************************/
# /*------------------------------------*/
# /* プロジェクト名                     */
# /*------------------------------------*/
PROJECT := scheduler
# /*------------------------------------*/
# /* com(FFTW)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
FFTW_PACK    := com/fftw3
else
#FFTW_PACK    := com/mingw/fftw3
FFTW_PACK    := com/fftw3
endif
FFTW_LIB_DIR := ${TOP_DIR}/${FFTW_PACK}/lib
FFTW_INC_DIR := ${TOP_DIR}/${FFTW_PACK}/include

# /*------------------------------------*/
# /* com(OPENCV)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
OPENCV_PACK    := com/opencv
else
#OPENCV_PACK    := com/mingw/opencv
OPENCV_PACK    := com/opencv
endif
OPENCV_LIB_DIR := ${TOP_DIR}/${OPENCV_PACK}/lib
OPENCV_INC_DIR := ${TOP_DIR}/${OPENCV_PACK}/include

# /*------------------------------------*/
# /* com(IPOPT)                         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
IPOPT_PACK    := com/ipopt
else
#IPOPT_PACK    := com/mingw/ipopt
IPOPT_PACK    := com/ipopt
endif
IPOPT_LIB_DIR := ${TOP_DIR}/${IPOPT_PACK}/lib
IPOPT_INC_DIR := ${TOP_DIR}/${IPOPT_PACK}/include \\
                 ${TOP_DIR}/${IPOPT_PACK}/include/coin

# /*------------------------------------*/
# /* com(NCL)                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
NCL_PACK    := com/ncl
else
NCL_PACK    := com/ncl
endif
NCL_LIB_DIR := ${OBJ_DIR}/${NCL_PACK}
NCL_INC_DIR := ${TOP_DIR}/${NCL_PACK}

# /*------------------------------------*/
# /* com(gaudi/mdf4lib)                 */
# /*------------------------------------*/
ifeq ($(MINGW_SIM), 1)
GAUDI_PACK    := com/gaudi
GAUDI_LIB_DIR := ${TOP_DIR}/${GAUDI_PACK}/lib
MDF4_PACK			:= com/mdf4lib
MDF4_LIB_DIR 	:= ${TOP_DIR}/${MDF4_PACK}/lib
endif

# /*------------------------------------*/
# /* rapid_sils(rapid lib)                */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
RAPID_LIB_DIR := ../../../rapid_lib/obj
endif

# /*------------------------------------*/
# /* rapid_sils(can)                    */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
CAN_LIB_DIR := /usr/lib
CAN_INC_DIR := /usr/include
endif

# /*------------------------------------*/
# /* rapid_sils(hjson)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
HJSON_LIB_DIR := ../../../external/hjson-cpp/linux_x64
endif

# /*------------------------------------*/
# /* rapid_sils(bson)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
BSON_LIB_DIR := ../../../external/bson-cxx/linux_x64
endif

# /*------------------------------------*/
# /* rapid_sils(zstd)                  */
# /*------------------------------------*/
ifeq ($(RAPID_SILS), 1)
ZSTD_LIB_DIR := ../../../external/zstd/linux_x64
endif


# /*------------------------------------*/
# /* Compiler Include Root Path         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
INCLUDE_ROOT	:= \\
				$(OS_DIR)/modules/renesas/driver/iccom			\\
				$(OS_DIR)/modules/ghs/bspsrc					\\
				$(OS_DIR)/modules/ghs/bspsrc/support			\\
				$(OS_DIR)/asp/arm64/INTEGRITY-include			\\
				$(OS_DIR)/INTEGRITY-include 					\\
				$(OS_DIR)/kernel								\\
				$(OS_DIR)/intlib								\\
				$(OS_DIR)										\\
				tgt 											\\
				${TOP_DIR}										\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\

else
INCLUDE_ROOT	:= \\
				${TOP_DIR}/mingw_sim								\\
				${TOP_DIR}									\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\
				$(TOP_DIR)/bsw/inc								\\
				$(TOP_DIR)/bsw/exclude/inc							\\
				${TOP_DIR_SILS}									\\
#?			${TOP_DIR_SILS}/sils/common									\\
#				${TOP_DIR}/mingw_sim/dummy_include						\\

ifeq ($(RAPID_SILS), 1)
INCLUDE_ROOT += $(CAN_INC_DIR)
endif


# /* SILS用ECU固有 Include Root Path	*/
INCLUDE_ROOT_SOC1	:= \\
				${TOP_DIR_SOC1}										\\
				$(TOP_DIR_SOC1)/mcucom								\\
				$(TOP_DIR_SOC1)/ecu									\\
				$(TOP_DIR_SOC1)/bsw/inc								\\
				$(TOP_DIR_SOC1)/common					\\					


INCLUDE_ROOT_SOC2	:= \\
				${TOP_DIR_SOC2}										\\
				$(TOP_DIR_SOC2)/mcucom								\\
				$(TOP_DIR_SOC2)/ecu									\\
				$(TOP_DIR_SOC2)/bsw/inc								\\
				$(TOP_DIR_SOC2)/common					\\					

INCLUDE_ROOT_MCU1	:= \\
				${TOP_DIR_MCU1}										\\
				$(TOP_DIR_MCU1)/mcucom								\\
				$(TOP_DIR_MCU1)/ecu									\\
				$(TOP_DIR_MCU1)/bsw/inc								\\
				$(TOP_DIR_MCU1)/common					\\	

INCLUDE_ROOT_MCU2	:= \\
				${TOP_DIR_MCU2}										\\
				$(TOP_DIR_MCU2)/mcucom								\\
				$(TOP_DIR_MCU2)/ecu									\\
				$(TOP_DIR_MCU2)/bsw/inc								\\
				$(TOP_DIR_MCU2)/common					\\	

endif


# /*------------------------------------*/
# /* Link lib                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a		\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\

else
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv_calib3d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_features2d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_flann.a				\\
	$(OPENCV_LIB_DIR)/libopencv_highgui.a			\\
	$(OPENCV_LIB_DIR)/libopencv_imgproc.a			\\
	$(OPENCV_LIB_DIR)/libopencv_core.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a			\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\
	$(IPOPT_LIB_DIR)/libcoinmumps.a							\\
	$(IPOPT_LIB_DIR)/libcoinmetis.a						\\
	$(IPOPT_LIB_DIR)/libopenblas_haswell-r0.2.18.a	\\
	$(GAUDI_LIB_DIR)/libConvert.a \\
	$(GAUDI_LIB_DIR)/libFileIO.a \\
	$(GAUDI_LIB_DIR)/libGaudiCore.a \\
	$(GAUDI_LIB_DIR)/libGaudiData.a \\
	$(GAUDI_LIB_DIR)/libboost_regex.a \\
	$(MDF4_LIB_DIR)/libMF4Lib_SO_x86_mt.a \\
	$(GAUDI_LIB_DIR)/libPlugin.a \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc2.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu2.a  \\
#	$(FFTW_LIB_DIR)/libfftw3-3.lib.a						\\
#	$(FFTW_LIB_DIR)/libfftw3f-3.lib.a						\\
#	$(OPENCV_LIB_DIR)/libopencv_calib3d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_core249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_features2d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_flann249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_highgui249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_imgproc249.dll.a			\\
#	$(IPOPT_LIB_DIR)/libIpOptFSS.a							\\
#	$(IPOPT_LIB_DIR)/libIpOpt-vc10.a						\\
#	$(IPOPT_LIB_DIR)/liblanekeep_pathoptimizer_Bspline.a	\\

ifeq ($(RAPID_SILS), 1)
LIBS += $(RAPID_LIB_DIR)/libbsw.a\\
				$(RAPID_LIB_DIR)/libdumper.a\\
				$(RAPID_LIB_DIR)/libslog.a\\
				$(RAPID_LIB_DIR)/libsys.a\\
				$(BSON_LIB_DIR)/libbson-cxx.ubuntu16.04.a\\
				$(HJSON_LIB_DIR)/libhjson.ubuntu16.04.a\\
				$(ZSTD_LIB_DIR)/libzstd.ubuntu16.04.a\\
				$(CAN_LIB_DIR)/libcanlib.so
endif" . 2685) (t 23502 35262 562817 268000) nil (2685 . 13501) ("*/
# /* Component List File                */
# /*------------------------------------*/
COMP_LIST_FILE := ${TOP_DIR}/mng/comp_list.txt


# /* SILS用 Component List File         */
COMP_LIST_FILE_SOC1 := ${TOP_DIR}/mng/comp_list_soc1.txt
COMP_LIST_FILE_SOC2 := ${TOP_DIR}/mng/comp_list_soc2.txt
COMP_LIST_FILE_MCU1 := ${TOP_DIR}/mng/comp_list_mcu1.txt
COMP_LIST_FILE_MCU2 := ${TOP_DIR}/mng/comp_list_mcu2.txt

# /*------------------------------------*/
# /* Section 設定ファイル               */
# /*------------------------------------*/
SECTION_TEMPLATE := ${MAKE_DIR}/INTEGRITY_template.ld
SECTIONFILE      := ${TOP_DIR}/mng/INTEGRITY.ld
PT_CONFIG        := ${TOP_DIR}/mng/pt_config.txt

# /*------------------------------------*/
# /* Mng Path                           */
# /*------------------------------------*/
MNG_DIR  := ${TOP_DIR}/mng


# /*------------------------------------*/
# /* Releaseプロジェクト名定義ファイル  */
# /*------------------------------------*/
REL_DEF_FILE := ${TOP_DIR}/ecu/ecu_id.h

# /***************************************************************************/
# /* 出力ファイル(Path) Config                                               */
# /***************************************************************************/
# /*------------------------------------*/
# /* Object Path                        */
# /*------------------------------------*/
OBJ_DIR  := ${TOP_DIR}/_obj

# /*------------------------------------*/
# /* Release File Path                  */
# /*------------------------------------*/
REL_DIR  := ${TOP_DIR}/_release

# /*------------------------------------*/
# /* Source Delete Temporary Path       */
# /*------------------------------------*/
TMP_DEL_DIR := ${TOP_DIR}/_tmp_del

# /*------------------------------------*/
# /* Command Log File                   */
# /*------------------------------------*/
CMD_LOG_ALL  := ${OBJ_DIR}/all_cmd.log

# /*------------------------------------*/
# /* Error Log File                     */
# /*------------------------------------*/
ALL_ERR_LIST := ${OBJ_DIR}/all_err.log

# /*------------------------------------*/
# /* 秀丸 Jump Taglist                  */
# /*------------------------------------*/
HIDE_ERR_LIST := ${OBJ_DIR}/errlist_tagjump.txt

# /*------------------------------------*/
# /* Release Infomation File Name       */
# /*------------------------------------*/
REL_INFO := _release_info.txt

# /***************************************************************************/
# /* Define                                                                  */
# /***************************************************************************/
# /*------------------------------------*/
# /* プロジェクト名                     */
# /*------------------------------------*/
PROJECT := scheduler
# /*------------------------------------*/
# /* com(FFTW)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
FFTW_PACK    := com/fftw3
else
#FFTW_PACK    := com/mingw/fftw3
FFTW_PACK    := com/fftw3
endif
FFTW_LIB_DIR := ${TOP_DIR}/${FFTW_PACK}/lib
FFTW_INC_DIR := ${TOP_DIR}/${FFTW_PACK}/include

# /*------------------------------------*/
# /* com(OPENCV)                          */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
OPENCV_PACK    := com/opencv
else
#OPENCV_PACK    := com/mingw/opencv
OPENCV_PACK    := com/opencv
endif
OPENCV_LIB_DIR := ${TOP_DIR}/${OPENCV_PACK}/lib
OPENCV_INC_DIR := ${TOP_DIR}/${OPENCV_PACK}/include

# /*------------------------------------*/
# /* com(IPOPT)                         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
IPOPT_PACK    := com/ipopt
else
#IPOPT_PACK    := com/mingw/ipopt
IPOPT_PACK    := com/ipopt
endif
IPOPT_LIB_DIR := ${TOP_DIR}/${IPOPT_PACK}/lib
IPOPT_INC_DIR := ${TOP_DIR}/${IPOPT_PACK}/include \\
                 ${TOP_DIR}/${IPOPT_PACK}/include/coin

# /*------------------------------------*/
# /* com(NCL)                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
NCL_PACK    := com/ncl
else
NCL_PACK    := com/ncl
endif
NCL_LIB_DIR := ${OBJ_DIR}/${NCL_PACK}
NCL_INC_DIR := ${TOP_DIR}/${NCL_PACK}

# /*------------------------------------*/
# /* com(gaudi/mdf4lib)                 */
# /*------------------------------------*/
ifeq ($(MINGW_SIM), 1)
GAUDI_PACK    := com/gaudi
GAUDI_LIB_DIR := ${TOP_DIR}/${GAUDI_PACK}/lib
MDF4_PACK			:= com/mdf4lib
MDF4_LIB_DIR 	:= ${TOP_DIR}/${MDF4_PACK}/lib
endif


# /*------------------------------------*/
# /* Compiler Include Root Path         */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
INCLUDE_ROOT	:= \\
				$(OS_DIR)/modules/renesas/driver/iccom			\\
				$(OS_DIR)/modules/ghs/bspsrc					\\
				$(OS_DIR)/modules/ghs/bspsrc/support			\\
				$(OS_DIR)/asp/arm64/INTEGRITY-include			\\
				$(OS_DIR)/INTEGRITY-include 					\\
				$(OS_DIR)/kernel								\\
				$(OS_DIR)/intlib								\\
				$(OS_DIR)										\\
				tgt 											\\
				${TOP_DIR}										\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\

else
INCLUDE_ROOT	:= \\
				${TOP_DIR}/mingw_sim								\\
				${TOP_DIR}									\\
				${FFTW_LIB_DIR}									\\
				${OPENCV_LIB_DIR}								\\
				${IPOPT_LIB_DIR}								\\
				$(TOP_DIR)/pf/schdl								\\
				$(TOP_DIR)/pf/sync								\\
				$(TOP_DIR)/mcucom								\\
				$(TOP_DIR)/ecu									\\
				$(TOP_DIR)/time_sync								\\
				$(TOP_DIR)/mng									\\
				$(FFTW_INC_DIR)									\\
				$(OPENCV_INC_DIR)								\\
				$(IPOPT_INC_DIR)								\\
				$(NCL_INC_DIR)									\\
				$(TOP_DIR)/bsw/inc								\\
				$(TOP_DIR)/bsw/exclude/inc							\\
				${TOP_DIR_SILS}									\\
#				${TOP_DIR}/mingw_sim/dummy_include						\\

# /* SILS用ECU固有 Include Root Path	*/
INCLUDE_ROOT_SOC1	:= \\
				${TOP_DIR_SOC1}										\\
				$(TOP_DIR_SOC1)/mcucom								\\
				$(TOP_DIR_SOC1)/ecu									\\
				$(TOP_DIR_SOC1)/bsw/inc								\\
				$(TOP_DIR_SOC1)/common					\\					


INCLUDE_ROOT_SOC2	:= \\
				${TOP_DIR_SOC2}										\\
				$(TOP_DIR_SOC2)/mcucom								\\
				$(TOP_DIR_SOC2)/ecu									\\
				$(TOP_DIR_SOC2)/bsw/inc								\\
				$(TOP_DIR_SOC2)/common					\\					

INCLUDE_ROOT_MCU1	:= \\
				${TOP_DIR_MCU1}										\\
				$(TOP_DIR_MCU1)/mcucom								\\
				$(TOP_DIR_MCU1)/ecu									\\
				$(TOP_DIR_MCU1)/bsw/inc								\\
				$(TOP_DIR_MCU1)/common					\\	

INCLUDE_ROOT_MCU2	:= \\
				${TOP_DIR_MCU2}										\\
				$(TOP_DIR_MCU2)/mcucom								\\
				$(TOP_DIR_MCU2)/ecu									\\
				$(TOP_DIR_MCU2)/bsw/inc								\\
				$(TOP_DIR_MCU2)/common					\\	

endif


# /*------------------------------------*/
# /* Link lib                           */
# /*------------------------------------*/
ifneq ($(MINGW_SIM), 1)
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a		\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\

else
LIBS := \\
	$(FFTW_LIB_DIR)/libfftw3f.a			\\
	$(OPENCV_LIB_DIR)/libopencv_calib3d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_features2d.a			\\
	$(OPENCV_LIB_DIR)/libopencv_flann.a				\\
	$(OPENCV_LIB_DIR)/libopencv_highgui.a			\\
	$(OPENCV_LIB_DIR)/libopencv_imgproc.a			\\
	$(OPENCV_LIB_DIR)/libopencv_core.a			\\
	$(OPENCV_LIB_DIR)/libopencv.a			\\
	$(IPOPT_LIB_DIR)/libipopt.a			\\
	$(IPOPT_LIB_DIR)/libcoinmumps.a							\\
	$(IPOPT_LIB_DIR)/libcoinmetis.a						\\
	$(IPOPT_LIB_DIR)/libopenblas_haswell-r0.2.18.a	\\
	$(GAUDI_LIB_DIR)/libConvert.a \\
	$(GAUDI_LIB_DIR)/libFileIO.a \\
	$(GAUDI_LIB_DIR)/libGaudiCore.a \\
	$(GAUDI_LIB_DIR)/libGaudiData.a \\
	$(GAUDI_LIB_DIR)/libboost_regex.a \\
	$(MDF4_LIB_DIR)/libMF4Lib_SO_x86_mt.a \\
	$(GAUDI_LIB_DIR)/libPlugin.a \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/soc2.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu1.a  \\
	# /home/sils/SILS_Source/SILS/src/sils/com/ecu/mcu2.a  \\
#	$(FFTW_LIB_DIR)/libfftw3-3.lib.a						\\
#	$(FFTW_LIB_DIR)/libfftw3f-3.lib.a						\\
#	$(OPENCV_LIB_DIR)/libopencv_calib3d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_core249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_features2d249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_flann249.dll.a				\\
#	$(OPENCV_LIB_DIR)/libopencv_highgui249.dll.a			\\
#	$(OPENCV_LIB_DIR)/libopencv_imgproc249.dll.a			\\
#	$(IPOPT_LIB_DIR)/libIpOptFSS.a							\\
#	$(IPOPT_LIB_DIR)/libIpOpt-vc10.a						\\
#	$(IPOPT_LIB_DIR)/liblanekeep_pathoptimizer_Bspline.a	\\" . 2685) ((marker . 3527) . -138) ((marker . 3527) . -138) ((marker . 3600) . -136) ((marker . 3600) . -136) ((marker . 3217) . -409) ((marker . 3217) . -409) ((marker . 3683) . -46) ((marker . 3683) . -46) ((marker . 3570) . -137) ((marker . 3570) . -137) ((marker . 3525) . -237) ((marker . 3525) . -237) ((marker . 3526) . -180) ((marker . 3526) . -180) ((marker . 3455) . -351) ((marker . 3455) . -351) ((marker . 3684) . -3) ((marker . 3684) . -3) ((marker . 3412) . -408) ((marker . 3412) . -408) ((marker . 3498) . -294) ((marker . 3498) . -294) ((marker* . 11323) . 8173) ((marker* . 11323) . 8216) ((marker* . 11323) . 8173) ((marker* . 11323) . 8173) ((marker . 2685) . -137) ((marker* . 11323) . 8173) ((marker* . 11323) . 8173) ((marker . 2685) . -137) ((marker . 3093) . -89) ((marker . 3093) . -89) ((marker* . 11323) . 8173) ((marker* . 11323) . 8173) ((marker . 2685) . -137) ((marker* . 11323) . 8173) ((marker* . 11323) . 8173) ((marker . 2685) . -137) ((marker . 2685) . -465) ((marker . 2685) . -137) ((marker . 2685) . -465) ((marker . 2685) . -408) (t 23497 15555 204405 277000)))
