
((digest . "75b579f677db06a552b4da87649eeb5d") (undo-list nil (1222 . 9380) ("
/****************************************************************************/
/*					スタティック関数宣言									*/
/****************************************************************************/
#define APPFW_RECV_PORT 15010

#define HEADER_DELIMITER 0xffffffff
#define HEADER_SIZE  12
#define ACCEPT_TIMEOUT 10 //sec
#define RECEIVE_TIMEOUT 10 //sec
#define ACCEPT_TIMEOUT_MS (ACCEPT_TIMEOUT*1000) //msec
#define RECEIVE_TIMEOUT_MS (RECEIVE_TIMEOUT*1000) //msec

#define MIN(a, b) ((a)<(b)?(a):(b))
#define MAX(a, b) ((a)>(b)?(a):(b))

static int sock = -1;
static int sock_accept = -1;
static bool sock_connected = false;
static uint8_t *temp_recv_buf=NULL;
static uint8_t *temp_serialize_buf = NULL;
static size_t max_buf_size = 0;

typedef union {
  /**BUFFER_SIZE_LIST_START**/
  char m0[ADXDIGSMINFO_SERIALIZED_SIZE];
  char m1[ADXDIGSMSTATUS_SERIALIZED_SIZE];
  char m2[ADXINCMOBJINFO_SERIALIZED_SIZE];
  char m3[ADXLCMOBJINFO_SERIALIZED_SIZE];
  char m4[ADXLOCSMSTATUS_SERIALIZED_SIZE];
  char m5[ADXROADMARKINGATTRIBUTE_SERIALIZED_SIZE];
  char m6[ADXTPCMOBJINFO_SERIALIZED_SIZE];
  char m7[ADX_APPSTATEAIPLN_SERIALIZED_SIZE];
  char m8[ADX_APPSTATEDLRCG_SERIALIZED_SIZE];
  char m9[ADX_APPSTATELANEPOE_SERIALIZED_SIZE];
  char m10[ADX_APPSTATEMAP_SERIALIZED_SIZE];
  char m11[ADX_APPSTATERESOURSEMANAGER_SERIALIZED_SIZE];
  char m12[ADX_APPSTETEDATAUPLOADER_SERIALIZED_SIZE];
  char m13[ADX_DIAGSTATE_SERIALIZED_SIZE];
  char m14[ADX_ET_SERIALIZED_SIZE];
  char m15[ADX_GRIDMAPLCM_SERIALIZED_SIZE];
  char m16[ADX_GRIDMAPTPCM_SERIALIZED_SIZE];
  char m17[ADX_INCMOBJECTDATA_SERIALIZED_SIZE];
  char m18[ADX_INCMSTATE_SERIALIZED_SIZE];
  char m19[ADX_LCMOBJECTDATA_SERIALIZED_SIZE];
  char m20[ADX_LCMSTATE_SERIALIZED_SIZE];
  char m21[ADX_SIGNDATA_SERIALIZED_SIZE];
  char m22[ADX_TPCMOBJECTDATA_SERIALIZED_SIZE];
  char m23[ADX_TPCMSTATE_SERIALIZED_SIZE];
  char m24[ADX_TRAFFICLIGHTDATA_SERIALIZED_SIZE];
  char m25[TELESIGNDATA_SERIALIZED_SIZE];
  char m26[TELELINEDATA_SERIALIZED_SIZE];
  char m27[EINNERLINEDATA_SERIALIZED_SIZE];
  char m28[ADX_FRLIDAROBJDATAINCGENERALPATH_SERIALIZED_SIZE];
  char m29[ADX_INCMOBJECTDATA_INT_SERIALIZED_SIZE];
  char m30[ADX_LCMOBJECTDATA_INT_SERIALIZED_SIZE];
  char m31[ADX_POLARMAPLCM_SERIALIZED_SIZE];
  char m32[ADX_POLARMAPTPCM_SERIALIZED_SIZE];
  char m33[ADX_RECOGNITIONSENSORSTATE_SERIALIZED_SIZE];
  char m34[ADX_RECOGNITIONSENSORSTATEFAILURE_SERIALIZED_SIZE];
  char m35[ADX_TPCMOBJECTDATA_INT_SERIALIZED_SIZE];
  char m36[ADXLANEDATAARRAY_SERIALIZED_SIZE];
  char m37[ADXLANEBOUNDARYDATAARRAY_SERIALIZED_SIZE];
  char m38[ADX_ECUPLANNEROUTPUTRESULT_SERIALIZED_SIZE];
  char m39[DLRLIDARSTATUSINFO_SERIALIZED_SIZE];
  char m40[DLRLIDARSTATUSINFO_SERIALIZED_SIZE];
  char m41[DLRLIDARSTATUSINFO_SERIALIZED_SIZE];
  char m42[DLRLIDARSTATUSINFO_SERIALIZED_SIZE];
  char m43[ADX_LCMSTATE_SERIALIZED_SIZE];
  char m44[ADX_TPCMSTATE_SERIALIZED_SIZE];
  char m45[ADX_INCMSTATE_SERIALIZED_SIZE];
  char m46[DLRSMSTATUSINFO_SERIALIZED_SIZE];
  /**BUFFER_SIZE_LIST_END**/
} BufferSizeList;

typedef size_t (*deserialize_func_ptr)(void *data, void *buffer);
typedef struct{
  uint32_t data_label;
  void *output_buffer;
  deserialize_func_ptr des_func;
  uint32_t serialized_size;
} DataInfo;

typedef size_t (*serialize_func_ptr)(void *buffer, const void *data, size_t max_buffer_size);


/****************************************************************************/
/* 関数名		:	fn_appfw_recv_init								*/
/*--------------------------------------------------------------------------*/
/* 機能			:	appfw_recv_init										*/
/*--------------------------------------------------------------------------*/
/* 引数			: なし														*/
/*--------------------------------------------------------------------------*/
/* 戻り値		: なし														*/
/****************************************************************************/
VD	fn_appfw_recv_init(VD)
{
  LINUX_PRINT_OUT(\"%s:%d start-------------\\n\", __FUNCTION__, __LINE__);

  struct sockaddr_in addr;

  //socket初期化
  sock = socket(AF_INET, SOCK_STREAM, 0);
  if (sock < 0) {
    Slog_Error(\"socket failed.\");
    return;
  }
  int yes = 1;
  setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (const char *)&yes, sizeof(yes));

  //port初期化
  addr.sin_family = AF_INET;
  addr.sin_port = htons(APPFW_RECV_PORT);
  addr.sin_addr.s_addr = INADDR_ANY;
  if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) != 0) {
    Slog_Error(\"bind error.\");
    return;
  }
  if (listen(sock, 1) != 0) {
    Slog_Error(\"listen error.\");
    return;
  }

  max_buf_size = sizeof(BufferSizeList);

  //シリアライズサイズメモリ確保
  temp_recv_buf = malloc(max_buf_size);

  //crc32初期化
  fpmw_recv_crc32_init();

  LINUX_PRINT_OUT(\"%s:%d end-------------\\n\", __FUNCTION__, __LINE__);
	return;
}

/****************************************************************************/
/* 関数名		:	fn_appfw_recv_compute							*/
/*--------------------------------------------------------------------------*/
/* 機能			:	fn_appfw_recv_compute											*/
/*--------------------------------------------------------------------------*/
/* 引数			: なし														*/
/*--------------------------------------------------------------------------*/
/* 戻り値		: なし														*/
/****************************************************************************/
VD	fn_appfw_recv_compute(VD)
{
  LINUX_PRINT_OUT(\"%s:%d start-------------\\n\", __FUNCTION__, __LINE__);

  size_t i;

  // ダミーのデータ
  /**DUMMY_DATA_DEF_START**/
  ADXDigsmInfo adx_digsm_info;
  ADXDigsmStatus adx_digsm_status;
  ADXIncmObjInfo adx_incm_obj_info;
  ADXLcmObjInfo adx_lcm_obj_info;
  ADXLocSmStatus adx_loc_sm_status;
  ADXRoadMarkingAttribute adx_road_marking_attribute;
  ADXTpcmObjInfo adx_tpcm_obj_info;
  ADX_AppStateAIPln adx_app_state_ai_pln;
  ADX_AppStateDLrcg adx_app_state_dl_rcg;
  ADX_AppStateLanePOE adx_app_state_lane_poe;
  ADX_AppStateMap adx_app_state_map;
  ADX_AppStateResourseManager adx_app_state_resource_manager;
  ADX_AppSteteDataUploader adx_app_state_data_uploader;
  ADX_DiagState adx_diag_state;
  ADX_ET adx_et;
  ADX_GridmapLcm adx_gridmap_lcm;
  ADX_GridmapTpcm adx_gridmap_tpcm;
  ADX_IncmObjectData adx_incm_object_data;
  ADX_IncmState adx_incm_state;
  ADX_LcmObjectData adx_lcm_object_data;
  ADX_LcmState adx_lcm_state;
  ADX_SignData adx_sign_data;
  ADX_TpcmObjectData adx_tpcm_object_data;
  ADX_TpcmState adx_tpcm_state;
  ADX_TrafficLightData adx_traffic_light_data;
  TeleSignData LOC_52_03_tele_sign_data;
  TeleLineData LOC_52_02_tele_line_data;
  EInnerLineData einner_line_data;
  ADX_FrLidarObjDataIncGeneralPath adx_fr_lidar_obj_data_inc_general_path;
  ADX_IncmObjectData_Int adx_incm_objectdata_int;
  ADX_LcmObjectData_Int adx_lcm_objectdata_int;
  ADX_PolarmapLcm adx_polarmap_lcm;
  ADX_PolarmapTpcm adx_polarmap_tpcm;
  ADX_RecognitionSensorState adx_recognition_sensor_state;
  ADX_RecognitionSensorStateFailure adx_recognition_sensor_state_failure;
  ADX_TpcmObjectData_Int adx_tpcm_objectdata_int;
  ADXLaneDataArray adx_lane_data_array;
  ADXLaneBoundaryDataArray adx_lane_boundary_data_array;
  ADX_EcuPlannerOutputResult adx_ecu_pl_output_result;
  DlrLidarStatusInfo dlr_frlidar_status_info;
  DlrLidarStatusInfo dlr_rrlidar_status_info;
  DlrLidarStatusInfo dlr_ltlidar_status_info;
  DlrLidarStatusInfo dlr_rtlidar_status_info;
  ADX_LcmState adx_dlr_lcm_state;
  ADX_TpcmState adx_dlr_tpcm_state;
  ADX_IncmState adx_dlr_incm_state;
  DlrsmStatusInfo dlr_sm_status_info;
  /**DUMMY_DATA_DEF_END**/

  /**DUMMY_RECV_DATA_START**/
  ADXDigsmInfo * recv_adx_digsm_info = &adx_digsm_info;
  ADXDigsmStatus * recv_adx_digsm_status = &adx_digsm_status;
  ADXIncmObjInfo * recv_adx_incm_obj_info = &adx_incm_obj_info;
  ADXLcmObjInfo * recv_adx_lcm_obj_info = &adx_lcm_obj_info;
  ADXLocSmStatus * recv_adx_loc_sm_status = &adx_loc_sm_status;
  ADXRoadMarkingAttribute * recv_adx_road_marking_attribute = &adx_road_marking_attribute;
  ADXTpcmObjInfo * recv_adx_tpcm_obj_info = &adx_tpcm_obj_info;
  ADX_AppStateAIPln * recv_adx_app_state_ai_pln = &adx_app_state_ai_pln;
  ADX_AppStateDLrcg * recv_adx_app_state_dl_rcg = &adx_app_state_dl_rcg;
  ADX_AppStateLanePOE * recv_adx_app_state_lane_poe = &adx_app_state_lane_poe;
  ADX_AppStateMap * recv_adx_app_state_map = &adx_app_state_map;
  ADX_AppStateResourseManager * recv_adx_app_state_resource_manager = &adx_app_state_resource_manager;
  ADX_AppSteteDataUploader * recv_adx_app_state_data_uploader = &adx_app_state_data_uploader;
  ADX_DiagState * recv_adx_diag_state = &adx_diag_state;
  ADX_ET * recv_adx_et = &adx_et;
  ADX_GridmapLcm * recv_adx_gridmap_lcm = &adx_gridmap_lcm;
  ADX_GridmapTpcm * recv_adx_gridmap_tpcm = &adx_gridmap_tpcm;
  ADX_IncmObjectData * recv_adx_incm_object_data = &adx_incm_object_data;
  ADX_IncmState * recv_adx_incm_state = &adx_incm_state;
  ADX_LcmObjectData * recv_adx_lcm_object_data =&adx_lcm_object_data;
  ADX_LcmState * recv_adx_lcm_state = &adx_lcm_state;
  ADX_SignData * recv_adx_sign_data = &adx_sign_data;
  ADX_TpcmObjectData * recv_adx_tpcm_object_data = &adx_tpcm_object_data;
  ADX_TpcmState * recv_adx_tpcm_state = &adx_tpcm_state;
  ADX_TrafficLightData * recv_adx_traffic_light_data = &adx_traffic_light_data;
  TeleSignData * recv_LOC_52_03_tele_sign_data = &LOC_52_03_tele_sign_data;
  TeleLineData * recv_LOC_52_02_tele_line_data = &LOC_52_02_tele_line_data;
  EInnerLineData * recv_einner_line_data = &einner_line_data;
  ADX_FrLidarObjDataIncGeneralPath * recv_adx_fr_lidar_obj_data_inc_general_path = &adx_fr_lidar_obj_data_inc_general_path;
  ADX_IncmObjectData_Int * recv_adx_incm_objectdata_int = &adx_incm_objectdata_int;
  ADX_LcmObjectData_Int * recv_adx_lcm_objectdata_int = &adx_lcm_objectdata_int;
  ADX_PolarmapLcm * recv_adx_polarmap_lcm = &adx_polarmap_lcm;
  ADX_PolarmapTpcm * recv_adx_polarmap_tpcm = &adx_polarmap_tpcm;
  ADX_RecognitionSensorState * recv_adx_recognition_sensor_state = &adx_recognition_sensor_state;
  ADX_RecognitionSensorStateFailure * recv_adx_recognition_sensor_state_failure = &adx_recognition_sensor_state_failure;
  ADX_TpcmObjectData_Int * recv_adx_tpcm_objectdata_int = &adx_tpcm_objectdata_int;
  ADXLaneDataArray * recv_adx_lane_data_array = &adx_lane_data_array;
  ADXLaneBoundaryDataArray * recv_adx_lane_boundary_data_array = &adx_lane_boundary_data_array;
  ADX_EcuPlannerOutputResult * recv_adx_ecu_pl_output_result = &adx_ecu_pl_output_result;
  DlrLidarStatusInfo * recv_dlr_frlidar_status_info = &dlr_frlidar_status_info;
  DlrLidarStatusInfo * recv_dlr_rrlidar_status_info = &dlr_rrlidar_status_info;
  DlrLidarStatusInfo * recv_dlr_ltlidar_status_info = &dlr_ltlidar_status_info;
  DlrLidarStatusInfo * recv_dlr_rtlidar_status_info = &dlr_rtlidar_status_info;
  ADX_LcmState * recv_adx_dlr_lcm_state = &adx_dlr_lcm_state;
  ADX_TpcmState * recv_adx_dlr_tpcm_state = &adx_dlr_tpcm_state;
  ADX_IncmState * recv_adx_dlr_incm_state = &adx_dlr_incm_state;
  DlrsmStatusInfo * recv_dlr_sm_status_info = &dlr_sm_status_info;
  /**DUMMY_RECV_DATA_END**/

  
  DataInfo data_info_list[] = {
    /**DATA_INFO_LIST_START**/
    {kIoDataLabelADXDigsmInfo, (void*)recv_adx_digsm_info, (serialize_func_ptr)&SerializeADXDigsmInfo},
    {kIoDataLabelADXDigsmStatus, (void*)recv_adx_digsm_status, (serialize_func_ptr)&SerializeADXDigsmStatus},
    {kIoDataLabelADXIncmObjInfo, (void*)recv_adx_incm_obj_info, (serialize_func_ptr)&SerializeADXIncmObjInfo},
    {kIoDataLabelADXLcmObjInfo, (void*)recv_adx_lcm_obj_info, (serialize_func_ptr)&SerializeADXLcmObjInfo},
    {kIoDataLabelADXLocSmStatus, (void*)recv_adx_loc_sm_status, (serialize_func_ptr)&SerializeADXLocSmStatus},
    {kIoDataLabelADXRoadMarkingAttribute, (void*)recv_adx_road_marking_attribute, (serialize_func_ptr)&SerializeADXRoadMarkingAttribute},
    {kIoDataLabelADXTpcmObjInfo, (void*)recv_adx_tpcm_obj_info, (serialize_func_ptr)&SerializeADXTpcmObjInfo},
    {kIoDataLabelADX_AppStateAIPln, (void*)recv_adx_app_state_ai_pln, (serialize_func_ptr)&SerializeADX_AppStateAIPln},
    {kIoDataLabelADX_AppStateDLrcg, (void*)recv_adx_app_state_dl_rcg, (serialize_func_ptr)&SerializeADX_AppStateDLrcg},
    {kIoDataLabelADX_AppStateLanePOE, (void*)recv_adx_app_state_lane_poe, (serialize_func_ptr)&SerializeADX_AppStateLanePOE},
    {kIoDataLabelADX_AppStateMap, (void*)recv_adx_app_state_map, (serialize_func_ptr)&SerializeADX_AppStateMap},
    {kIoDataLabelADX_AppStateResourseManager, (void*)recv_adx_app_state_resource_manager, (serialize_func_ptr)&SerializeADX_AppStateResourseManager},
    {kIoDataLabelADX_AppSteteDataUploader, (void*)recv_adx_app_state_data_uploader, (serialize_func_ptr)&SerializeADX_AppSteteDataUploader},
    {kIoDataLabelADX_DiagState, (void*)recv_adx_diag_state, (serialize_func_ptr)&SerializeADX_DiagState},
    {kIoDataLabelADX_ET, (void*)recv_adx_et, (serialize_func_ptr)&SerializeADX_ET},
    {kIoDataLabelADX_GridmapLcm, (void*)recv_adx_gridmap_lcm, (serialize_func_ptr)&SerializeADX_GridmapLcm},
    {kIoDataLabelADX_GridmapTpcm, (void*)recv_adx_gridmap_tpcm, (serialize_func_ptr)&SerializeADX_GridmapTpcm},
    {kIoDataLabelADX_IncmObjectData, (void*)recv_adx_incm_object_data, (serialize_func_ptr)&SerializeADX_IncmObjectData},
    {kIoDataLabelADX_IncmState, (void*)recv_adx_incm_state, (serialize_func_ptr)&SerializeADX_IncmState},
    {kIoDataLabelADX_LcmObjectData, (void*)recv_adx_lcm_object_data, (serialize_func_ptr)&SerializeADX_LcmObjectData},
    {kIoDataLabelADX_LcmState, (void*)recv_adx_lcm_state, (serialize_func_ptr)&SerializeADX_LcmState},
    {kIoDataLabelADX_SignData, (void*)recv_adx_sign_data, (serialize_func_ptr)&SerializeADX_SignData},
    {kIoDataLabelADX_TpcmObjectData, (void*)recv_adx_tpcm_object_data, (serialize_func_ptr)&SerializeADX_TpcmObjectData},
    {kIoDataLabelADX_TpcmState, (void*)recv_adx_tpcm_state, (serialize_func_ptr)&SerializeADX_TpcmState},
    {kIoDataLabelADX_TrafficLightData, (void*)recv_adx_traffic_light_data, (serialize_func_ptr)&SerializeADX_TrafficLightData},
    {kIoDataLabelTeleSignData, (void*)recv_LOC_52_03_tele_sign_data, (serialize_func_ptr)&SerializeTeleSignData},
    {kIoDataLabelTeleLineData, (void*)recv_LOC_52_02_tele_line_data, (serialize_func_ptr)&SerializeTeleLineData},
    {kIoDataLabelEInnerLineData, (void*)recv_einner_line_data, (serialize_func_ptr)&SerializeEInnerLineData},
    {kIoDataLabelADX_FrLidarObjDataIncGeneralPath, (void*)recv_adx_fr_lidar_obj_data_inc_general_path, (serialize_func_ptr)&SerializeADX_FrLidarObjDataIncGeneralPath},
    {kIoDataLabelADX_IncmObjectData_Int, (void*)recv_adx_incm_objectdata_int, (serialize_func_ptr)&SerializeADX_IncmObjectData_Int},
    {kIoDataLabelADX_LcmObjectData_Int, (void*)recv_adx_lcm_objectdata_int, (serialize_func_ptr)&SerializeADX_LcmObjectData_Int},
    {kIoDataLabelADX_PolarmapLcm, (void*)recv_adx_polarmap_lcm, (serialize_func_ptr)&SerializeADX_PolarmapLcm},
    {kIoDataLabelADX_PolarmapTpcm, (void*)recv_adx_polarmap_tpcm, (serialize_func_ptr)&SerializeADX_PolarmapTpcm},
    {kIoDataLabelADX_RecognitionSensorState, (void*)recv_adx_recognition_sensor_state, (serialize_func_ptr)&SerializeADX_RecognitionSensorState},
    {kIoDataLabelADX_RecognitionSensorStateFailure, (void*)recv_adx_recognition_sensor_state_failure, (serialize_func_ptr)&SerializeADX_RecognitionSensorStateFailure},
    {kIoDataLabelADX_TpcmObjectData_Int, (void*)recv_adx_tpcm_objectdata_int, (serialize_func_ptr)&SerializeADX_TpcmObjectData_Int},
    {kIoDataLabelADXLaneDataArray, (void*)recv_adx_lane_data_array, (serialize_func_ptr)&SerializeADXLaneDataArray},
    {kIoDataLabelADXLaneBoundaryDataArray, (void*)recv_adx_lane_boundary_data_array, (serialize_func_ptr)&SerializeADXLaneBoundaryDataArray},
    {kIoDataLabelADX_EcuPlannerOutputResult, (void*)recv_adx_ecu_pl_output_result, (serialize_func_ptr)&SerializeADX_EcuPlannerOutputResult},
    {kIoDataLabelDlrLidarStatusInfo, (void*)recv_dlr_frlidar_status_info, (serialize_func_ptr)&SerializeDlrLidarStatusInfo},
    {kIoDataLabelDlrLidarStatusInfo2, (void*)recv_dlr_rrlidar_status_info, (serialize_func_ptr)&SerializeDlrLidarStatusInfo},
    {kIoDataLabelDlrLidarStatusInfo3, (void*)recv_dlr_ltlidar_status_info, (serialize_func_ptr)&SerializeDlrLidarStatusInfo},
    {kIoDataLabelDlrLidarStatusInfo4, (void*)recv_dlr_rtlidar_status_info, (serialize_func_ptr)&SerializeDlrLidarStatusInfo},
    {kIoDataLabelADX_LcmState2, (void*)recv_adx_dlr_lcm_state, (serialize_func_ptr)&SerializeADX_LcmState},
    {kIoDataLabelADX_TpcmState2, (void*)recv_adx_dlr_tpcm_state, (serialize_func_ptr)&SerializeADX_TpcmState},
    {kIoDataLabelADX_IncmState2, (void*)recv_adx_dlr_incm_state, (serialize_func_ptr)&SerializeADX_IncmState},
    {kIoDataLabelDlrsmStatusInfo, (void*)recv_dlr_sm_status_info, (serialize_func_ptr)&SerializeDlrsmStatusInfo},
    /**DATA_INFO_LIST_END**/
  };
  size_t data_info_list_count = (size_t)(sizeof(data_info_list)/sizeof(DataInfo));

  //全受信フラグリセット
  for (i=0; i<data_info_list_count; i++) {
    // Appfw_MsgUtilSetPubRequest(data_info_list[i].output_buffer, false);
  }
  
  if (sock < 0) {
    Slog_Error(\"socket error.\");
    return;
  }

  //未接続時は接続要求を待つ
  if (sock_connected == false) {
    struct pollfd fds = {0};
    fds.fd = sock;
    fds.events = POLLIN | POLLERR;
    int pret = poll(&fds, 1, ACCEPT_TIMEOUT_MS);
    if (pret < 0 || (fds.revents & POLLIN) == 0) {
      //接続要求待ちタイムアウト or エラー -> retry
      return;
    }

    //接続要求あり
    struct sockaddr_in client;
    socklen_t len = (socklen_t)sizeof(client);
    sock_accept = accept(sock, (struct sockaddr *)&client, (socklen_t*)&len);
    if (sock_accept < 0) {
      Slog_Error(\"accept error.\");
      return;
    }
    sock_connected = true;
    Slog_Info(\"connected.\");
  }

  //受信
  uint32_t header_len_received = 0;
  uint32_t data_len_expect = 0;
  uint32_t data_len_received = 0;
  uint32_t data_label = 0;
  char header_buf[HEADER_SIZE] = {0};

  while(1) {

    struct pollfd fds = {0};
    fds.fd = sock_accept;
    fds.events = POLLIN | POLLERR;
    int pret = poll(&fds, 1, RECEIVE_TIMEOUT_MS);
    if (pret == 0 && (fds.revents & POLLIN) == 0){
      //timeout
      if ((header_len_received>0) || (data_len_received>0)) {
        //メッセージ受信途中のタイムアウトはエラー
        Slog_Error(\"receiving timeout error\");
      }
      return;
    }
    if (pret < 0) {
      if (errno == EINTR) {
        Slog_Debug(\"poll() EINTR\");
        continue;
      }
      Slog_Error(\"poll: %s\", strerror(errno));
      return;
    }

    if (header_len_received < HEADER_SIZE){
      //ヘッダの抽出
      uint32_t len_read = HEADER_SIZE-header_len_received;
      errno = 0;
      int32_t len_result = (int32_t)read(sock_accept, &header_buf[header_len_received], len_read);
      if (len_result == 0) {
        //コネクション切断
        Slog_Info(\"connection closed. ret:0, %s\", strerror(errno));
        sock_connected = false;
        close(sock_accept);
        sock_accept = -1;
        return;
      } else if (len_result < 0) {
        if (errno == EINTR) {
          Slog_Debug(\"read() EINTR\");
          continue;
        }
        //ソケットエラー
        Slog_Info(\"connection closed. %s\", strerror(errno));
        sock_connected = false;
        close(sock_accept);
        sock_accept = -1;
        return;
      }
      header_len_received += (uint32_t)len_result;
      if (header_len_received == HEADER_SIZE) {
        uint32_t delim = (*((uint32_t*)(void*)&header_buf[0]));
        if (delim == HEADER_DELIMITER){
          //ヘッダがそろったらデータ長とIDを取得
          data_label      = (*((uint32_t*)(void*)&header_buf[4]));
          data_len_expect = (*((uint32_t*)(void*)&header_buf[8]));
          //未定義の大きいデータが送信された場合は一旦バッファを拡張（データラベル判定時に破棄する）
          if (max_buf_size < data_len_expect) {
            free(temp_recv_buf);
            max_buf_size = data_len_expect;
            temp_recv_buf = malloc(max_buf_size);
          }
          if (data_len_expect <= 0) {
            //データサイズのエラー
            Slog_Error(\"data size error.\");
            return;
          }
        } else {
          //ヘッダのデリミタ照合エラー
          Slog_Error(\"unknown header delimiter\");
          return;
        }
      }

    } else if (data_len_expect > 0) {
      //データの抽出
      uint32_t len_read = data_len_expect - data_len_received;
      int32_t len_result = (int32_t)read(sock_accept, &temp_recv_buf[data_len_received], len_read);
      if (len_result <= 0) {
        if (errno == EINTR) {
          Slog_Debug(\"read() EINTR\");
          continue;
        }
        //ソケットエラーかデータ受信途中でコネクション切断エラー
        Slog_Error(\"read error. %s\", strerror(errno));
        sock_connected = false;
        close(sock_accept);
        sock_accept = -1;
        return;
      }
      data_len_received += (uint32_t)len_result;
      if (data_len_received == data_len_expect) {
        //１パケット受信完了
        bool found = false;
        for (i=0; i<data_info_list_count; i++) {
          if (data_label == data_info_list[i].data_label) {
            found = true;
            if (data_len_received == data_info_list[i].serialized_size) {
              (data_info_list[i].des_func)(data_info_list[i].output_buffer, (void*)temp_recv_buf);
              // fn_appfw_test_recv_compute()のトリガ呼び出し
              fn_schdl_api_send_trig(CEN_SCHDL_TRIG_APPFW_TEST_RECV_DATA);

              // それともこれ？
              //Appfw_MsgUtilSetPubRequest(data_info_list[i].output_buffer, true);
              " . 1222) ((marker . 1222) . -3330) ((marker* . 9380) . 15984) ((marker* . 9380) . 15984) ((marker . 1222) . -5314) ((marker* . 9380) . 15984) ((marker* . 9380) . 15984) ((marker . 1222) . -5314) ((marker . 1222) . -5314) ((marker . 1222) . -5314) ((marker* . 9380) . 13860) ((marker* . 9380) . 13896) ((marker . 1222) . -6493) ((marker* . 9380) . 13860) ((marker* . 9380) . 13860) ((marker . 1222) . -6493) ((marker* . 9380) . 13338) ((marker* . 9380) . 13338) ((marker . 1222) . -7400) ((marker* . 9380) . 13502) ((marker* . 9380) . 13502) ((marker . 1222) . -7400) ((marker* . 9380) . 13265) ((marker* . 9380) . 13406) ((marker* . 9380) . 13338) ((marker* . 9380) . 13338) ((marker . 1222) . -7678) ((marker* . 9380) . 13051) ((marker* . 9380) . 13098) ((marker . 1222) . -7328) ((marker* . 9380) . 13098) ((marker* . 9380) . 13098) ((marker . 1222) . -7894) ((marker* . 9380) . 11903) ((marker* . 9380) . 11783) ((marker . 1222) . -8351) ((marker* . 9380) . 11783) ((marker* . 9380) . 11903) ((marker . 1222) . -8860) ((marker* . 9380) . 10478) ((marker* . 9380) . 10926) ((marker . 1222) . -8659) ((marker* . 9380) . 11783) ((marker* . 9380) . 11783) ((marker . 1222) . -9038) ((marker* . 9380) . 4695) ((marker* . 9380) . 4695) ((marker . 1222) . -15465) ((marker* . 9380) . 4695) ((marker* . 9380) . 4695) ((marker . 1222) . -15465) ((marker* . 9380) . 4695) ((marker* . 9380) . 4695) ((marker . 1222) . -15465) ((marker* . 9380) . 4695) ((marker* . 9380) . 4695) ((marker . 1222) . -16022) ((marker* . 9380) . 4238) ((marker* . 9380) . 4695) ((marker . 1222) . -16274) ((marker* . 9380) . 4238) ((marker* . 9380) . 4238) ((marker . 1222) . -16894) ((marker* . 9380) . 4238) ((marker* . 9380) . 4238) ((marker . 1222) . -16894) ((marker* . 9380) . 4238) ((marker* . 9380) . 4238) ((marker . 1222) . -16894) ((marker* . 9380) . 4238) ((marker* . 9380) . 4238) ((marker . 1222) . -16894) ((marker . 1222) . -17060) ((marker . 1222) . -16894) ((marker . 1222) . -17060) ((marker* . 9380) . 4238) ((marker* . 9380) . 4238) ((marker . 1222) . -16894) ((marker* . 9380) . 4238) ((marker* . 9380) . 4238) ((marker . 1222) . -16894) ((marker* . 9380) . 4048) ((marker* . 9380) . 3985) ((marker . 1222) . -16894) ((marker* . 9380) . 13763) ((marker* . 9380) . 13763) ((marker . 1222) . -6775) ((marker* . 9380) . 11783) ((marker* . 9380) . 11783) ((marker . 1222) . -8860) ((marker* . 9380) . 6375) ((marker* . 9380) . 6375) ((marker . 1222) . -14022) ((marker . 1222) . -14022) ((marker . 1222) . -14923) ((marker* . 9380) . 11589) ((marker* . 9380) . 11589) ((marker . 1222) . -14022) ((marker* . 9380) . 11617) ((marker* . 9380) . 11617) ((marker . 1222) . -8659) ((marker* . 9380) . 11617) ((marker* . 9380) . 11617) ((marker . 1222) . -8659) ((marker* . 9380) . 11698) ((marker* . 9380) . 11698) ((marker . 1222) . -8659) ((marker* . 9380) . 11698) ((marker* . 9380) . 11698) ((marker . 1222) . -8659) ((marker* . 9380) . 11698) ((marker* . 9380) . 11698) ((marker . 1222) . -8659) ((marker* . 9380) . 11698) ((marker* . 9380) . 11698) ((marker . 1222) . -8659) ((marker* . 9380) . 12038) ((marker* . 9380) . 12038) ((marker . 1222) . -8860) ((marker* . 9380) . 13427) ((marker* . 9380) . 13427) ((marker . 1222) . -6998) ((marker* . 9380) . 13433) ((marker* . 9380) . 13433) ((marker . 1222) . -7438) ((marker* . 9380) . 6004) ((marker* . 9380) . 13070) ((marker . 1222) . -7466) ((marker* . 9380) . 13070) ((marker* . 9380) . 13070) ((marker . 1222) . -7803) ((marker* . 9380) . 13682) ((marker* . 9380) . 13618) ((marker . 1222) . -6998) ((marker* . 9380) . 13803) ((marker* . 9380) . 13803) ((marker . 1222) . -7110) ((marker* . 9380) . 4448) ((marker* . 9380) . 4448) ((marker . 1222) . -16604) ((marker . 1222) . -16604) ((marker . 1222) . -16850) ((marker* . 9380) . 13803) ((marker* . 9380) . 13803) ((marker . 1222) . -7110) ((marker* . 9380) . 13803) ((marker* . 9380) . 13803) ((marker . 1222) . -7110) ((marker* . 9380) . 13803) ((marker* . 9380) . 13803) ((marker . 1222) . -7110) ((marker* . 9380) . 13803) ((marker* . 9380) . 13803) ((marker . 1222) . -7110) ((marker* . 9380) . 13803) ((marker* . 9380) . 13803) ((marker . 1222) . -7110) ((marker . 1222) . -7110) ((marker . 1222) . -7495) ((marker* . 9380) . 4372) ((marker* . 9380) . 4372) ((marker . 1222) . -16369) ((marker* . 9380) . 4372) ((marker* . 9380) . 4372) ((marker . 1222) . -16369) ((marker* . 9380) . 4372) ((marker* . 9380) . 4372) ((marker . 1222) . -16369) ((marker . 1222) . -16117) ((marker . 1222) . -16894) ((marker* . 9380) . 4397) ((marker . 1222) . -16117) ((marker* . 9380) . 4397) ((marker* . 9380) . 4397) ((marker . 1222) . -16117) ((marker* . 9380) . 4397) ((marker* . 9380) . 4397) ((marker . 1222) . -16117) ((marker . 1222) . -16894) ((marker* . 9380) . 4397) ((marker* . 9380) . 4397) ((marker . 1222) . -16493) ((marker* . 9380) . 4404) ((marker* . 9380) . 4397) ((marker . 1222) . -16588) ((marker* . 9380) . 4404) ((marker* . 9380) . 4404) ((marker . 1222) . -16588) ((marker* . 9380) . 4404) ((marker* . 9380) . 4404) ((marker . 1222) . -16588) ((marker . 9774) . -4048) ((marker . 9774) . -4048) ((marker . 10046) . -4665) ((marker . 10046) . -4665) ((marker . 9937) . -4745) ((marker . 9937) . -4745) ((marker . 9739) . -4506) ((marker . 9739) . -4506) ((marker . 9662) . -4223) ((marker . 9662) . -4223) ((marker . 9763) . -4066) ((marker . 9763) . -4066) ((marker* . 9380) . 4371) ((marker* . 9380) . 4371) ((marker . 1222) . -16588) ((marker . 1222) . -16588) ((marker . 1222) . -21201) ((marker* . 9380) . 97) ((marker* . 9380) . 55) ((marker . 1222) . -20738) ((marker . 9423) . -3991) ((marker . 9423) . -4517) ((marker . 9423) . -4517) ((marker . 9755) . -4211) ((marker . 9755) . -4211) ((marker . 9773) . -4210) ((marker . 9773) . -4210) ((marker . 9858) . -4116) ((marker . 9858) . -4116) ((marker . 9539) . -4100) ((marker . 9539) . -4100) ((marker . 9591) . -4112) ((marker . 9591) . -4112) ((marker . 9769) . -4443) ((marker . 9769) . -4443) ((marker . 10185) . -4523) ((marker . 10185) . -4523) ((marker . 9504) . -4518) ((marker . 9504) . -4518) ((marker . 9967) . -4736) ((marker . 9967) . -4736) ((marker . 9551) . -4252) ((marker . 9551) . -4252) ((marker* . 9380) . 16781) ((marker* . 9380) . 16781) ((marker . 1222) . -4048) ((marker* . 9380) . 16781) ((marker* . 9380) . 16781) ((marker . 1222) . -4048) ((marker . 9845) . -3991) ((marker . 9845) . -3991) ((marker . 1222) . -4517) ((marker . 1222) . -4048) ((marker . 1222) . -4517) ((marker) . -4506) ((marker) . -4518) (t 23561 57602 601001 0) nil ("


AppfwError Appfw_MsgUtilSetPubRequest(const void *msg, bool req) {
  AppfwOutputMsgTable *output_table = MsgUtilGetOutputMsgTable();
  if (!output_table) {
    Slog_Error(\"%s: 出力メセージ保存先のキー取得に失敗しました。\", __func__);
    return kAppfwErrThreadLocalStrageFail;
  }

  if (output_table->current_entries != output_table->max_entries) {
    Slog_Error(
        \"セットされている出力メセージ数が正しくない可能性があります。\"
        \"登録数: %ld, 出力メッセージ数: %ld\",
        output_table->current_entries, output_table->max_entries);
    assert(false);
  }

  // 検索処理
  for (int i = 0; i < output_table->current_entries; i++) {
    // 同じアドレスのエントリを探し、見つかればアドレスに紐づくものに値を設定
    if (output_table->table[i].msg == msg) {
      *output_table->table[i].req = req;
      return kAppfwSuccess;
    }
  }

  // 見つからない=未登録なのでエラーとする
  return kAppfwErrNotFound;
}
" . -4552) ((marker . 10046) . -747) ((marker . 10046) . -747) ((marker . 9937) . -713) ((marker . 9937) . -713) ((marker . 9423) . -672) ((marker . 9423) . -672) ((marker . 9423) . -807) ((marker . 9967) . -741) ((marker . 9967) . -741) ((marker) . -805) ((marker) . -807) ((marker) . -807) 5359 (t 23561 57581 301001 0) nil (18929 . 18930) nil (18927 . 18929) nil (23241 . 23243) (t 23561 56375 145001 0) nil ("/" . 23241) ("/" . 23241) (t 23561 56283 613001 0) nil undo-tree-canary))
