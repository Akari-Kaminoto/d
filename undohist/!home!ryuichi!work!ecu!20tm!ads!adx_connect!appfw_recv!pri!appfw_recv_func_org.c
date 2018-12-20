
((digest . "73e8729bf79e93856cd33cb8838642db") (undo-list nil (12408 . 12409) (t 23576 48071 194104 176000) nil ("
" . 14836) ((marker . 14837) . -1) ((marker . 12316) . -1) ((marker . 12316) . -1) ((marker . 12410) . -1) (t 23576 48069 454104 176000) nil ("/**RECV_DATA_LIST_START**/
ADXDigsmInfo *recv_adx_digsm_info = (ADXDigsmInfo *)&adxcon_recv_01_st_g_adx_digsm_info;
ADXDigsmStatus *recv_adx_digsm_status = (ADXDigsmStatus *)&adxcon_recv_02_st_g_adx_digsm_status;
ADXIncmObjInfo *recv_adx_incm_obj_info = (ADXIncmObjInfo *)&adxcon_recv_03_st_g_adx_incm_obj_info;
ADXLcmObjInfo *recv_adx_lcm_obj_info = (ADXLcmObjInfo *)&adxcon_recv_04_st_g_adx_lcm_obj_info;
ADXLocSmStatus *recv_adx_loc_sm_status = (ADXLocSmStatus *)&adxcon_recv_05_st_g_adx_loc_sm_status;
ADXRoadMarkingAttribute *recv_adx_road_marking_attribute = (ADXRoadMarkingAttribute *)&adxcon_recv_06_st_g_adx_road_marking_attribute;
ADXTpcmObjInfo *recv_adx_tpcm_obj_info = (ADXTpcmObjInfo *)&adxcon_recv_07_st_g_adx_tpcm_obj_info;
ADX_AppStateAIPln *recv_adx_app_state_ai_pln = (ADX_AppStateAIPln *)&adxcon_recv_08_st_g_adx_app_state_ai_pln;
ADX_AppStateDLrcg *recv_adx_app_state_dl_rcg = (ADX_AppStateDLrcg *)&adxcon_recv_09_st_g_adx_app_state_d_lrcg;
ADX_AppStateLanePOE *recv_adx_app_state_lane_poe = (ADX_AppStateLanePOE *)&adxcon_recv_10_st_g_adx_app_state_lane_poe;
ADX_AppStateMap *recv_adx_app_state_map = (ADX_AppStateMap *)&adxcon_recv_11_st_g_adx_app_state_map;
ADX_AppStateResourseManager *recv_adx_app_state_resourse_manager = (ADX_AppStateResourseManager *)&adxcon_recv_12_st_g_adx_app_state_resourse_manager;
ADX_AppSteteDataUploader *recv_adx_app_stete_data_uploader = (ADX_AppSteteDataUploader *)&adxcon_recv_13_st_g_adx_app_stete_data_uploader;
ADX_DiagState *recv_adx_diag_state = (ADX_DiagState *)&adxcon_recv_14_st_g_adx_diag_state;
ADX_ET *recv_adx_et = (ADX_ET *)&adxcon_recv_15_st_g_adx_et;
ADX_GridmapLcm *recv_adx_gridmap_lcm = (ADX_GridmapLcm *)&adxcon_recv_16_st_g_adx_gridmap_lcm;
ADX_GridmapTpcm *recv_adx_gridmap_tpcm = (ADX_GridmapTpcm *)&adxcon_recv_17_st_g_adx_gridmap_tpcm;
ADX_IncmObjectData *recv_adx_incm_object_data = (ADX_IncmObjectData *)&adxcon_recv_18_st_g_adx_incm_object_data;
ADX_IncmState *recv_adx_incm_state = (ADX_IncmState *)&adxcon_recv_19_st_g_adx_incm_state;
ADX_LcmObjectData *recv_adx_lcm_object_data = (ADX_LcmObjectData *)&adxcon_recv_20_st_g_adx_lcm_object_data;
ADX_LcmState *recv_adx_lcm_state = (ADX_LcmState *)&adxcon_recv_21_st_g_adx_lcm_state;
ADX_SignData *recv_adx_sign_data = (ADX_SignData *)&adxcon_recv_22_st_g_adx_sign_data;
ADX_TpcmObjectData *recv_adx_tpcm_object_data = (ADX_TpcmObjectData *)&adxcon_recv_23_st_g_adx_tpcm_object_data;
ADX_TpcmState *recv_adx_tpcm_state = (ADX_TpcmState *)&adxcon_recv_24_st_g_adx_tpcm_state;
ADX_TrafficLightData *recv_adx_traffic_light_data = (ADX_TrafficLightData *)&adxcon_recv_25_st_g_adx_traffic_light_data;
TeleSignData *recv_LOC_52_03_tele_sign_data = (TeleSignData *)&adxcon_recv_26_st_g_tele_sign_data;
TeleLineData *recv_LOC_52_02_tele_line_data = (TeleLineData *)&adxcon_recv_27_st_g_tele_line_data;
EInnerLineData *recv_einner_line_data = (EInnerLineData *)&adxcon_recv_28_st_g_e_inner_line_data;
ADX_FrLidarObjDataIncGeneralPath *recv_adx_fr_lidar_obj_data_inc_general_path = (ADX_FrLidarObjDataIncGeneralPath *)&adxcon_recv_29_st_g_adx_fr_lidar_obj_data_inc_general_path;
ADX_IncmObjectData_Int *recv_adx_incm_objectdata_int = (ADX_IncmObjectData_Int *)&adxcon_recv_30_st_g_adx_incm_object_data_int;
ADX_LcmObjectData_Int *recv_adx_lcm_objectdata_int = (ADX_LcmObjectData_Int *)&adxcon_recv_31_st_g_adx_lcm_object_data_int;
ADX_PolarmapLcm *recv_adx_polarmap_lcm = (ADX_PolarmapLcm *)&adxcon_recv_32_st_g_adx_polarmap_lcm;
ADX_PolarmapTpcm *recv_adx_polarmap_tpcm = (ADX_PolarmapTpcm *)&adxcon_recv_33_st_g_adx_polarmap_tpcm;
ADX_RecognitionSensorState *recv_adx_recognition_sensor_state = (ADX_RecognitionSensorState *)&adxcon_recv_34_st_g_adx_recognition_sensor_state;
ADX_RecognitionSensorStateFailure *recv_adx_recognition_sensor_state_failure = (ADX_RecognitionSensorStateFailure *)&adxcon_recv_35_st_g_adx_recognition_sensor_state_failure;
ADX_TpcmObjectData_Int *recv_adx_tpcm_objectdata_int = (ADX_TpcmObjectData_Int *)&adxcon_recv_36_st_g_adx_tpcm_object_data_int;
ADXLaneDataArray *recv_adx_lane_data_array = (ADXLaneDataArray *)&adxcon_recv_37_st_g_adx_lane_data_array;
ADXLaneBoundaryDataArray *recv_adx_lane_boundary_data_array = (ADXLaneBoundaryDataArray *)&adxcon_recv_38_st_g_adx_lane_boundary_data_array;
ADX_EcuPlannerOutputResult *recv_adx_ecu_pl_output_result = (ADX_EcuPlannerOutputResult *)&adxcon_recv_39_st_g_adx_ecu_planner_output_result;
DlrLidarStatusInfo *recv_dlr_frlidar_status_info = (DlrLidarStatusInfo *)&adxcon_recv_40_st_g_dlr_lidar_status_info;
DlrLidarStatusInfo *recv_dlr_rrlidar_status_info = (DlrLidarStatusInfo *)&adxcon_recv_41_st_g_dlr_lidar_status_info2;
DlrLidarStatusInfo *recv_dlr_ltlidar_status_info = (DlrLidarStatusInfo *)&adxcon_recv_42_st_g_dlr_lidar_status_info3;
DlrLidarStatusInfo *recv_dlr_rtlidar_status_info = (DlrLidarStatusInfo *)&adxcon_recv_43_st_g_dlr_lidar_status_info4;
ADX_LcmState *recv_adx_dlr_lcm_state   = (ADX_LcmState *)&adxcon_recv_44_st_g_adx_lcm_state2;
ADX_TpcmState *recv_adx_dlr_tpcm_state = (ADX_TpcmState *)&adxcon_recv_45_st_g_adx_tpcm_state2;
" . -14837) ((marker . 12409) . -5056) ((marker . 12315) . -4395) ((marker . 12664) . -4512) ((marker . 12664) . -4512) ((marker . 12348) . -4866) ((marker . 12348) . -4866) ((marker . 12621) . -4748) ((marker . 12621) . -4748) ((marker . 12315) . -4395) ((marker . 12315) . -4395) ((marker . 12533) . -5056) ((marker . 12533) . -5056) ((marker) . -5056) ((marker . 12316) . -4960) ((marker . 12316) . -4960) ((marker . 12532) . -4630) ((marker . 12532) . -4630) ((marker . 12409) . -5056) 19893 nil ("ADX_IncmState *recv_adx_dlr_incm_state = (ADX_IncmState *)&adxcon_recv_46_st_g_adx_incm_state2;
DlrsmStatusInfo *recv_dlr_sm_status_info = (DlrsmStatusInfo *)&adxcon_recv_47_st_g_dlrsm_status_info;
/**RECV_DATA_LIST_END**/
" . 19893) ((marker . 12409) . -223) ((marker . 12844) . -198) ((marker . 12844) . -198) ((marker) . -223) ((marker . 12409) . -223) 20116 (t 23576 39011 14104 176000) nil (" " . 14897) (" " . 14897) (" " . 14897) (" " . 14897) nil (" " . 14901) nil (" " . 14995) nil (" " . 15191) (" " . 15191) nil (" " . 15409) (" " . 15409) (" " . 15409) nil ("
" . 15409) nil (" " . 15635) (" " . 15635) (" " . 15635) ("
" . 15635) nil (" " . 15750) (" " . 15750) (" " . 15750) ("
" . 15750) nil (" " . 15869) (" " . 15869) (" " . 15869) ("
" . 15869) nil (" " . 16521) (" " . 16521) nil (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) (" " . 16443) nil (" " . 16367) (" " . 16367) (" " . 16367) (" " . 16367) nil (" " . 16109) (" " . 16109) (" " . 16109) ("
" . 16109) nil (" " . 16258) (" " . 16258) (" " . 16258) ("
" . 16258) nil (" " . 16759) (" " . 16759) (" " . 16759) ("
" . 16759) nil (" " . 16965) (" " . 16965) (" " . 16965) ("
" . 16965) nil (" " . 17907) (" " . 17907) (" " . 17907) ("
" . 17907) nil (" " . 17254) (" " . 17254) (" " . 17254) ("
" . 17254) nil (" " . 17466) (" " . 17466) (" " . 17466) ("
" . 17466) nil (" " . 18071) (" " . 18071) (" " . 18071) ("
" . 18071) nil (" " . 18201) (" " . 18201) (" " . 18201) ("
" . 18201) nil (" " . 18418) (" " . 18418) (" " . 18418) ("
" . 18418) nil (" " . 18546) (" " . 18546) (" " . 18546) ("
" . 18546) nil (" " . 18710) (" " . 18710) (" " . 18710) nil ("
" . 18710) nil (" " . 18865) (" " . 18865) (" " . 18865) ("
" . 18865) nil (" " . 18987) (" " . 18987) (" " . 18987) ("
" . 18987) nil (" " . 19115) (" " . 19115) (" " . 19115) ("
" . 19115) nil (" " . 19258) (" " . 19258) (" " . 19258) ("
" . 19258) nil (" " . 19748) nil (19748 . 19749) nil (" " . 19748) (" " . 19748) (" " . 19748) nil ("
" . 19748) nil (" " . 19630) (" " . 19630) (" " . 19630) (" " . 19630) (" " . 19630) nil (19630 . 19632) nil ("
" . 19630) nil (19512 . 19513) nil (" " . 19512) (" " . 19512) (" " . 19512) (" " . 19512) ("
" . 19512) nil (" " . 19395) (" " . 19395) (" " . 19395) ("
" . 19395) (t 23576 38841 474104 176000) nil (24164 . 24170) (" " . 24164) (24163 . 24164) nil (" " . 24116) (" " . 24116) (" " . 24116) (" " . 24116) (" " . 24116) (" " . 24116) ("
" . 24116) (t 23576 38803 78104 176000) nil (29922 . 29923) nil (" " . 29922) (" " . 29922) (" " . 29922) (" " . 29922) (" " . 29922) (" " . 29922) (" " . 29922) ("
" . 29922) nil (28418 . 28424) (" " . 28418) (28417 . 28418) nil (26882 . 26888) (" " . 26882) (26881 . 26882) nil (24302 . 24303) nil (" " . 24302) (" " . 24302) (" " . 24302) (" " . 24302) (" " . 24302) (" " . 24302) (" " . 24302) ("
" . 24302) nil (" " . 26609) (" " . 26609) (" " . 26609) (" " . 26609) (" " . 26609) (" " . 26609) nil ("
" . 26609) nil (26758 . 26759) nil (" " . 26758) (" " . 26758) (" " . 26758) (" " . 26758) (" " . 26758) (" " . 26758) (" " . 26758) ("
" . 26758) (t 23576 30407 803999 999000)))
