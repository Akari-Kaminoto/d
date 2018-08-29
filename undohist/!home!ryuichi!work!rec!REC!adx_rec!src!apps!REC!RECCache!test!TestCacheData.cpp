
((digest . "0787db1393240494e881546a3fdb389f") (undo-list nil ("P" . 872) ("_" . 872) nil (864 . 865) nil ("* @test
1.正常系：car_stateのタイムスタンプを指定してセンサーデータを読む。指定するタイムスタンプはcar_stateのタイムスタンプと一致する。
* @test
2.正常系：read_locator_camera_imageのタイムスタンプを指定してセンサーデータを読む。指定するタイムスタンプはread_locator_camera_imageのタイムスタンプと一致する。
* @test
3.正常系：IO_54_02_tele_camera_imageのタイムスタンプを指定してセンサーデータを読む。指定するタイムスタンプはIO_54_02_tele_camera_imageのタイムスタンプと一致する。
* @test
4.正常系：car_stateのタイムスタンプを指定してセンサーデータを読む。指定するタイムスタンプはcar_stateのタイムスタンプと一致しない。
* @test
5.正常系：read_locator_camera_imageのタイムスタンプを指定してセンサーデータを読む。指定するタイムスタンプはread_locator_camera_imageのタイムスタンプと一致しない。
* @test
6.正常系：IO_54_02_tele_camera_imageのタイムスタンプを指定してセンサーデータを読む。指定するタイムスタンプはIO_54_02_tele_camera_imageのタイムスタンプと一致しない。
* @test
7.正常系：car_stateのタイムスタンプを指定してセンサーデータを読む。指定したタイムスタンプとcar_stateが持つタイムスタンプの差を最大にする。ただし、指定したタイムスタンプよりも、car_stateが持つタイムスタンプは後であるものとする。
* @test
8.正常系：read_locator_camera_imageのタイムスタンプを指定してセンサーデータを読む。指定したタイムスタンプとread_locator_camera_imageが持つタイムスタンプの差を最大にする。ただし、指定したタイムスタンプよりも、read_locator_camera_imageが持つタイムスタンプは後であるものとする。
* @test
9.正常系：IO_54_02_tele_camera_imageのタイムスタンプを指定してセンサーデータを読む。指定したタイムスタンプとIO_54_02_tele_camera_imageが持つタイムスタンプの差を最大にする。ただし、指定したタイムスタンプよりも、IO_54_02_tele_camera_imageが持つタイムスタンプは後であるものとする。
* @test
10.正常系：car_stateのタイムスタンプを指定してセンサーデータを読む。指定したタイムスタンプとcar_stateが持つタイムスタンプの差を最大にする。ただし、指定したタイムスタンプよりも、car_stateが持つタイムスタンプは前であるものとする。
* @test
11.正常系：read_locator_camera_imageのタイムスタンプを指定してセンサーデータを読む。指定したタイムスタンプとread_locator_camera_imageが持つタイムスタンプの差を最大にする。ただし、指定したタイムスタンプよりも、read_locator_camera_image持つタイムスタンプは前であるものとする。
* @test
12.正常系：IO_54_02_tele_camera_imageのタイムスタンプを指定してセンサーデータを読む。指定したタイムスタンプとIO_54_02_tele_camera_imageが持つタイムスタンプの差を最大にする。ただし、指定したタイムスタンプよりも、IO_54_02_tele_camera_imageが持つタイムスタンプは前であるものとする。
* @test
13.異常系：car_stateのタイムスタンプを指定してセンサーデータを読む。car_stateのタイムスタンプが見つからない。ただし、指定したタイムスタンプよりも、car_stateが持つタイムスタンプは後であるものとする。
* @test
14.異常系：read_locator_camera_imageのタイムスタンプを指定してセンサーデータを読む。read_locator_camera_imageのタイムスタンプが見つからない。ただし、指定したタイムスタンプよりも、read_locator_camera_imageが持つタイムスタンプは後であるものとする。
* @test
15.異常系：IO_54_02_tele_camera_imageのタイムスタンプを指定してセンサーデータを読む。IO_54_02_tele_camera_imageのタイムスタンプが見つからない。ただし、指定したタイムスタンプよりも、IO_54_02_tele_camera_imageが持つタイムスタンプは後であるものとする。
* @test
16.異常系：car_stateのタイムスタンプを指定してセンサーデータを読む。car_stateのタイムスタンプが見つからない。ただし、指定したタイムスタンプよりも、car_stateが持つタイムスタンプは前であるものとする。
* @test
17.異常系：read_locator_camera_imageのタイムスタンプを指定してセンサーデータを読む。read_locator_camera_imageのタイムスタンプが見つからない。ただし、指定したタイムスタンプよりも、read_locator_camera_imageが持つタイムスタンプは前であるものとする。
* @test
18.異常系：IO_54_02_tele_camera_imageのタイムスタンプを指定してセンサーデータを読む。IO_54_02_tele_camera_imageのタイムスタンプが見つからない。ただし、指定したタイムスタンプよりも、IO_54_02_tele_camera_imageが持つタイムスタンプは前であるものとする。
" . 864) ((marker) . -8) ((marker . 897) . -2591) ((marker) . -2591) ((marker . 1134) . -91) ((marker . 1134) . -91) nil ("
" . 3455) ((marker) . -1) nil ("タイムスタンプのテストデータ範囲は６種類" . 863) nil ("K" . -853) ((marker . 606) . -1) 854 nil ("キャッシュデータタイプはcar_state, locator_camera_image, IO_54_02_tele_camera_image" . 854) nil (853 . 854) nil ("*" . 3547) nil (925 . 926) nil (844 . 845) nil ("*" . 826) nil (828 . 829) nil (816 . 818) (" " . 816) nil ("   cache_ptr_->Finalize();
    delete cache_ptr_;
    delete cache_data_;
" . -816) ((marker) . -74) ((marker . 606) . -74) ((marker) . -74) 890 nil (" " . 890) nil (" " . 818) nil (782 . 783) nil ("    cache_ptr_ = new cache::Cache;
    cache_ptr_->Initialize();

    testReadCacheParam param = GetParam();
    const TestReadCacheData kTestData = std::tr1::get<0>(param);
    const uint32_t kReceiveTimestamp = kTestData.receive_timestamp;
    cache_data_ = new CacheData;
    cache_data_->car_state.data_reference_timestamp = kReceiveTimestamp;
    cache_data_->locator_camera_image.car_pose.data_reference_timestamp =
        kReceiveTimestamp;
    cache_data_->IO_54_02_tele_camera_image.car_pose.data_reference_timestamp =
        kReceiveTimestamp;
    cache_data_->incm_camera_image.car_pose.data_reference_timestamp =
        kReceiveTimestamp;
    cache_data_->driver_monitor_image_dummy.car_pose.data_reference_timestamp =
        kReceiveTimestamp;
    cache_data_->fot_data_collect_dmc_data.pose.data_reference_timestamp =
        kReceiveTimestamp;
    //! fot_data_collect_driver_data
    //! time_stampを持たないのでDMCオブジェクトを参照する
    //! io_52_04_pcs_data
    //! time_stampを持たないのでCarStateオブジェクトを参照する
    //! io_52_04_pcs2_data
    //! time_stampを持たないのでCarStateオブジェクトを参照する
    //! lidar_fr_pc_set
    //! time_stampを持たないのでkLidarFrCarStateIO0302オブジェクトを参照する
    cache_data_->lidar_fr_car_state_IO_03_02.data_reference_timestamp =
        kReceiveTimestamp;
    //! lidar_rr_pc_set
    //! time_stampを持たないのでkLidarRrCarStateIO0302オブジェクトを参照する
    cache_data_->lidar_rr_car_state_IO_03_02.data_reference_timestamp =
        kReceiveTimestamp;
    //! lidar_rr_pc_correct_set
    //! time_stampを持たないのでkLidarRrCarStateIO0302オブジェクトを参照する
    //! lidar_rt_pc_set
    //! time_stampを持たないのでkLidarRtCarStateIO0302オブジェクトを参照する
    cache_data_->lidar_rt_car_state_IO_03_02.data_reference_timestamp =
        kReceiveTimestamp;
    //! lidar_rt_pc_correct_set
    //! time_stampを持たないのでkLidarRtCarStateIO0302オブジェクトを参照する
    //! lidar_lt_pc_set
    //! time_stampを持たないのでkLidarLtCarStateIO0302オブジェクトを参照する
    cache_data_->lidar_lt_car_state_IO_03_02.data_reference_timestamp =
        kReceiveTimestamp;
    //! lidar_lt_pc_correct_set
    //! time_stampを持たないのでkLidarLtCarStateIO0302オブジェクトを参照する
    //! io_52_04_rob_trigger_data
    //! time_stampを持たないのでkCarStateオブジェクトを参照する
    cache_data_->ads_pln_trajectory_data.car_pose.data_reference_timestamp =
        kReceiveTimestamp;
    //! fsn_objects_array_rcg_03_17
    //! time_stampを持たないのでkCarStateFusionObjectObjectLanePosObjectNotExistRegionオブジェクトを参照する
    cache_data_->car_state_FusionObject_ObjectLanePos_ObjectNotExistRegion
        .data_reference_timestamp = kReceiveTimestamp;

    cache_ptr_->Write(cache_data_);
" . -782) ((marker) . -2562) ((marker . 526) . -2562) ((marker . 526) . -2562) ((marker . 450) . -2082) ((marker . 606) . -2562) ((marker) . -2562) 3344 nil ("  virtual void* allocate(const enum CacheDataType data_type) {
    void* ptr;
    switch (data_type) {
      case CacheDataType::kSystemState:
        ptr = new SystemStateData;
        break;
      case CacheDataType::kCarState:
        ptr = new CarState;
        break;
      case CacheDataType::kLocatorCameraImage:
        ptr = new ImageData_adx_rec;
        break;
      case CacheDataType::kIo5402TeleCameraImage:
        ptr = new TeleImageData_adx_rec;
        break;
      case CacheDataType::kIncmCameraImage:
        ptr = new IncmImageData;
        break;
      case CacheDataType::kDriverMonitorImageDummy:
        ptr = new ImageData;
        break;
      case CacheDataType::kFotDataCollectDmcData:
        ptr = new DMC;
        break;
      case CacheDataType::kFotDataCollectDriverData:
        ptr = new DriverData;
        break;
      case CacheDataType::kIo5204PcsData:
        ptr = new PCS;
        break;
      case CacheDataType::kIo5204Pcs2Data:
        ptr = new PCS2;
        break;
      case CacheDataType::kLidarFrPcSet:
        ptr = new LidarPCData_set;
        break;
      case CacheDataType::kLidarFrCarStateIO0302:
        ptr = new CarState;
        break;
      case CacheDataType::kLidarRrPcSet:
        ptr = new LidarPCA_set;
        break;
      case CacheDataType::kLidarRrCarStateIO0302:
        ptr = new CarState;
        break;
      case CacheDataType::kLidarRrPcCorrectSet:
        ptr = new LidarPCAcorrect_set;
        break;
      case CacheDataType::kLidarRtPcSet:
        ptr = new LidarPCA_set;
        break;
      case CacheDataType::kLidarRtCarStateIO0302:
        ptr = new CarState;
        break;
      case CacheDataType::kLidarRtPcCorrectSet:
        ptr = new LidarPCAcorrect_set;
        break;
      case CacheDataType::kLidarLtPcSet:
        ptr = new LidarPCA_set;
        break;
      case CacheDataType::kLidarLtCarStateIO0302:
        ptr = new CarState;
        break;
      case CacheDataType::kLidarLtPcCorrectSet:
        ptr = new LidarPCAcorrect_set;
        break;
      case CacheDataType::kIo5204RobTriggerData:
        ptr = new RoBTrigger;
        break;
      case CacheDataType::kAdsPlnTrajectoryData:
        ptr = new IhvTrajectoryData;
        break;
      case CacheDataType::kFsnObjectsArrayRcg0317:
        ptr = new FusionObject_array;
        break;
      case CacheDataType::
          kCarStateFusionObjectObjectLanePosObjectNotExistRegion:
        ptr = new CarState;
        break;
      default:
        break;
    }
    return reinterpret_cast<void*>(ptr);
  }

  virtual void deallocate(const enum CacheDataType data_type, void* ptr) {
    switch (data_type) {
      case CacheDataType::kSystemState:
        delete reinterpret_cast<SystemStateData*>(ptr);
        break;
      case CacheDataType::kCarState:
        delete reinterpret_cast<CarState*>(ptr);
        break;
      case CacheDataType::kLocatorCameraImage:
        delete reinterpret_cast<ImageData_adx_rec*>(ptr);
        break;
      case CacheDataType::kIo5402TeleCameraImage:
        delete reinterpret_cast<TeleImageData_adx_rec*>(ptr);
        break;
      case CacheDataType::kIncmCameraImage:
        delete reinterpret_cast<IncmImageData*>(ptr);
        break;
      case CacheDataType::kDriverMonitorImageDummy:
        delete reinterpret_cast<ImageData*>(ptr);
        break;
      case CacheDataType::kFotDataCollectDmcData:
        delete reinterpret_cast<DMC*>(ptr);
        break;
      case CacheDataType::kFotDataCollectDriverData:
        delete reinterpret_cast<DriverData*>(ptr);
        break;
      case CacheDataType::kIo5204PcsData:
        delete reinterpret_cast<PCS*>(ptr);
        break;
      case CacheDataType::kIo5204Pcs2Data:
        delete reinterpret_cast<PCS2*>(ptr);
        break;
      case CacheDataType::kLidarFrPcSet:
        delete reinterpret_cast<LidarPCData_set*>(ptr);
        break;
      case CacheDataType::kLidarFrCarStateIO0302:
        delete reinterpret_cast<CarState*>(ptr);
        break;
      case CacheDataType::kLidarRrPcSet:
        delete reinterpret_cast<LidarPCA_set*>(ptr);
        break;
      case CacheDataType::kLidarRrCarStateIO0302:
        delete reinterpret_cast<CarState*>(ptr);
        break;
      case CacheDataType::kLidarRrPcCorrectSet:
        delete reinterpret_cast<LidarPCAcorrect_set*>(ptr);
        break;
      case CacheDataType::kLidarRtPcSet:
        delete reinterpret_cast<LidarPCA_set*>(ptr);
        break;
      case CacheDataType::kLidarRtCarStateIO0302:
        delete reinterpret_cast<CarState*>(ptr);
        break;
      case CacheDataType::kLidarRtPcCorrectSet:
        delete reinterpret_cast<LidarPCAcorrect_set*>(ptr);
        break;
      case CacheDataType::kLidarLtPcSet:
        delete reinterpret_cast<LidarPCA_set*>(ptr);
        break;
      case CacheDataType::kLidarLtCarStateIO0302:
        delete reinterpret_cast<CarState*>(ptr);
        break;
      case CacheDataType::kLidarLtPcCorrectSet:
        delete reinterpret_cast<LidarPCAcorrect_set*>(ptr);
        break;
      case CacheDataType::kIo5204RobTriggerData:
        delete reinterpret_cast<RoBTrigger*>(ptr);
        break;
      case CacheDataType::kAdsPlnTrajectoryData:
        delete reinterpret_cast<IhvTrajectoryData*>(ptr);
        break;
      case CacheDataType::kFsnObjectsArrayRcg0317:
        delete reinterpret_cast<FusionObject_array*>(ptr);
        break;
      case CacheDataType::
          kCarStateFusionObjectObjectLanePosObjectNotExistRegion:
        delete reinterpret_cast<CarState*>(ptr);
        break;
      default:
        break;
    }
  }

  virtual uint32_t GetDataWithTimestamp(const enum CacheDataType data_type,
                                        uint32_t request_timestamp,
                                        CacheData* data) {
    bool can_read = false;
    switch (data_type) {
      case CacheDataType::kSystemState:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->systemstate_data));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kCarState, request_timestamp,
            reinterpret_cast<void*>(&data->car_state));
        break;

      case CacheDataType::kCarState:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->car_state));
        break;

      case CacheDataType::kLocatorCameraImage:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->locator_camera_image));
        break;

      case CacheDataType::kIo5402TeleCameraImage:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->IO_54_02_tele_camera_image));
        break;

      case CacheDataType::kIncmCameraImage:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->incm_camera_image));
        break;

      case CacheDataType::kDriverMonitorImageDummy:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->driver_monitor_image_dummy));
        break;

      case CacheDataType::kFotDataCollectDmcData:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->fot_data_collect_dmc_data));
        break;

      case CacheDataType::kFotDataCollectDriverData:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->fot_data_collect_driver_data));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kFotDataCollectDmcData, request_timestamp,
            reinterpret_cast<void*>(&data->fot_data_collect_dmc_data));
        break;

      case CacheDataType::kIo5204PcsData:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->io_52_04_pcs_data));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kCarState, request_timestamp,
            reinterpret_cast<void*>(&data->car_state));
        break;

      case CacheDataType::kIo5204Pcs2Data:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->io_52_04_pcs2_data));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kCarState, request_timestamp,
            reinterpret_cast<void*>(&data->car_state));
        break;

      case CacheDataType::kLidarFrPcSet:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_fr_pc_set));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kLidarFrCarStateIO0302, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_fr_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarFrCarStateIO0302:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_fr_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarRrPcSet:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rr_pc_set));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kLidarRrCarStateIO0302, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rr_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarRrCarStateIO0302:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rr_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarRrPcCorrectSet:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rr_pc_correct_set));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kLidarRrCarStateIO0302, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rr_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarRtPcSet:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rt_pc_set));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kLidarRtCarStateIO0302, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rt_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarRtCarStateIO0302:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rt_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarRtPcCorrectSet:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rt_pc_correct_set));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kLidarRtCarStateIO0302, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_rt_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarLtPcSet:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_lt_pc_set));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kLidarLtCarStateIO0302, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_lt_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarLtCarStateIO0302:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_lt_car_state_IO_03_02));
        break;

      case CacheDataType::kLidarLtPcCorrectSet:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_lt_pc_correct_set));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kLidarLtCarStateIO0302, request_timestamp,
            reinterpret_cast<void*>(&data->lidar_lt_car_state_IO_03_02));
        break;

      case CacheDataType::kIo5204RobTriggerData:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->io_52_04_rob_trigger_data));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::kCarState, request_timestamp,
            reinterpret_cast<void*>(&data->car_state));
        break;

      case CacheDataType::kAdsPlnTrajectoryData:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->ads_pln_trajectory_data));
        break;

      case CacheDataType::kFsnObjectsArrayRcg0317:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(&data->fsn_objects_array_rcg_03_17));
        can_read = cache_ptr_->ReadWithTimestamp(
            CacheDataType::
                kCarStateFusionObjectObjectLanePosObjectNotExistRegion,
            request_timestamp,
            reinterpret_cast<void*>(
                &data->car_state_FusionObject_ObjectLanePos_ObjectNotExistRegion));
        break;

      case CacheDataType::
          kCarStateFusionObjectObjectLanePosObjectNotExistRegion:
        can_read = cache_ptr_->ReadWithTimestamp(
            data_type, request_timestamp,
            reinterpret_cast<void*>(
                &data->car_state_FusionObject_ObjectLanePos_ObjectNotExistRegion));
        break;

      default:
        break;
    }

    return can_read;
  }

  virtual uint32_t getTimeStamp(const enum CacheDataType data_type, void* ptr) {
    uint32_t timestamp;
    switch (data_type) {
      case CacheDataType::kSystemState:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kCarState:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLocatorCameraImage:
        timestamp = (reinterpret_cast<ImageData_adx_rec*>(ptr))
                        ->car_pose.data_reference_timestamp;
        break;
      case CacheDataType::kIo5402TeleCameraImage:
        timestamp = (reinterpret_cast<TeleImageData_adx_rec*>(ptr))
                        ->car_pose.data_reference_timestamp;
        break;
      case CacheDataType::kIncmCameraImage:
        timestamp = (reinterpret_cast<IncmImageData*>(ptr))
                        ->car_pose.data_reference_timestamp;
        break;
      case CacheDataType::kDriverMonitorImageDummy:
        timestamp = (reinterpret_cast<ImageData*>(ptr))
                        ->car_pose.data_reference_timestamp;
        break;
      case CacheDataType::kFotDataCollectDmcData:
        timestamp =
            (reinterpret_cast<DMC*>(ptr))->pose.data_reference_timestamp;
        break;
      case CacheDataType::kFotDataCollectDriverData:
        timestamp =
            (reinterpret_cast<DMC*>(ptr))->pose.data_reference_timestamp;
        break;
      case CacheDataType::kIo5204PcsData:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kIo5204Pcs2Data:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarFrPcSet:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarFrCarStateIO0302:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarRrPcSet:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarRrCarStateIO0302:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarRrPcCorrectSet:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarRtPcSet:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarRtCarStateIO0302:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarRtPcCorrectSet:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarLtPcSet:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarLtCarStateIO0302:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kLidarLtPcCorrectSet:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kIo5204RobTriggerData:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::kAdsPlnTrajectoryData:
        timestamp = (reinterpret_cast<IhvTrajectoryData*>(ptr))
                        ->car_pose.data_reference_timestamp;
        break;
      case CacheDataType::kFsnObjectsArrayRcg0317:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      case CacheDataType::
          kCarStateFusionObjectObjectLanePosObjectNotExistRegion:
        timestamp =
            (reinterpret_cast<CarState*>(ptr))->data_reference_timestamp;
        break;
      default:
        break;
    }
    return timestamp;
  }
" . -756) ((marker) . -18374) ((marker . 526) . -18374) ((marker . 526) . -18374) ((marker . 450) . -18327) ((marker . 606) . -15807) ((marker . 606) . -18374) ((marker) . -18374) 19130 (t 23403 47245 318004 0)))
