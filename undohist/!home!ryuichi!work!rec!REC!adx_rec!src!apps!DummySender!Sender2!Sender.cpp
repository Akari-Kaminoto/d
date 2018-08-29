
((digest . "2fbf9f347e8eebea0bc962634a3cabbd") (undo-list nil ("#endif
" . -1400) ((marker . 1) . -7) ((marker . 761) . -7) ((marker . 761) . -7) ((marker . 1) . -7) ((marker) . -7) ((marker . 1400) . -7) 1407 nil ("  // car_state
  SetCarState(car_state, cnt);
  AppfwTime timestamp = car_state->data_reference_timestamp;
  filename = GetFileName(\"car_state\", timestamp);
  SaveCarState(car_state, filename);

  // systemstate_data
  SetSystemStateData(systemstate_data, cnt);
  filename = GetFileName(\"systemstate_data\", timestamp);
  SaveSystemStateData(systemstate_data, filename);

  // locator_camera_image
  SetImageData_adx_rec(locator_camera_image, cnt);
  filename = GetFileName(\"locator_camera_image\", timestamp);
  SaveImageData_adx_rec(locator_camera_image, filename);

  // IO_54_02_tele_camera_image
  SetTeleImageData_adx_rec(IO_54_02_tele_camera_image, cnt);
  filename = GetFileName(\"IO_54_02_tele_camera_image\", timestamp);
  SaveTeleImageData_adx_rec(IO_54_02_tele_camera_image, filename);

  // incm_camera_image
  SetIncmImageData(incm_camera_image, cnt);
  filename = GetFileName(\"incm_camera_image\", timestamp);
  SaveIncmImageData(incm_camera_image, filename);

  // driver_monitor_image_dummy
  SetImageData(driver_monitor_image_dummy, cnt);
  filename = GetFileName(\"driver_monitor_image_dummy\", timestamp);
  SaveImageData(driver_monitor_image_dummy, filename);

  // fot_data_collect_dmc_data
  SetDMC(fot_data_collect_dmc_data, cnt);
  filename = GetFileName(\"fot_data_collect_dmc_data\", timestamp);
  SaveDMC(fot_data_collect_dmc_data, filename);

  // fot_data_collect_driver_data
  SetDriverData(fot_data_collect_driver_data, cnt);
  filename = GetFileName(\"fot_data_collect_driver_data\", timestamp);
  SaveDriverData(fot_data_collect_driver_data, filename);

  // io_52_04_pcs_data
  SetPCS(io_52_04_pcs_data, cnt);
  filename = GetFileName(\"io_52_04_pcs_data\", timestamp);
  SavePCS(io_52_04_pcs_data, filename);

  // io_52_04_pcs2_data
  SetPCS2(io_52_04_pcs2_data, cnt);
  filename = GetFileName(\"io_52_04_pcs2_data\", timestamp);
  SavePCS2(io_52_04_pcs2_data, filename);

  // lidar_fr_pc_set
  SetLidarPCData_set(lidar_fr_pc_set, cnt);
  filename = GetFileName(\"lidar_fr_pc_set\", timestamp);
  SaveLidarPCData_set(lidar_fr_pc_set, filename);

  // lidar_fr_car_state_IO_03_02
  SetCarState(lidar_fr_car_state_IO_03_02, cnt);
  filename = GetFileName(\"lidar_fr_car_state_IO_03_02\", timestamp);
  SaveCarState(lidar_fr_car_state_IO_03_02, filename);

  // lidar_rr_pc_set
  SetLidarPCA_set(lidar_rr_pc_set, cnt);
  filename = GetFileName(\"lidar_rr_pc_set\", timestamp);
  SaveLidarPCA_set(lidar_rr_pc_set, filename);

  // lidar_rr_car_state_IO_03_02
  SetCarState(lidar_rr_car_state_IO_03_02, cnt);
  filename = GetFileName(\"lidar_rr_car_state_IO_03_02\", timestamp);
  SaveCarState(lidar_rr_car_state_IO_03_02, filename);

  // lidar_rr_pc_correct_set
  SetLidarPCAcorrect_set(lidar_rr_pc_correct_set, cnt);
  filename = GetFileName(\"lidar_rr_pc_correct_set\", timestamp);
  SaveLidarPCAcorrect_set(lidar_rr_pc_correct_set, filename);

  // lidar_rt_pc_set
  SetLidarPCA_set(lidar_rt_pc_set, cnt);
  filename = GetFileName(\"lidar_rt_pc_set\", timestamp);
  SaveLidarPCA_set(lidar_rt_pc_set, filename);

  // lidar_rt_car_state_IO_03_02
  SetCarState(lidar_rt_car_state_IO_03_02, cnt);
  filename = GetFileName(\"lidar_rt_car_state_IO_03_02\", timestamp);
  SaveCarState(lidar_rt_car_state_IO_03_02, filename);

  // lidar_rt_car_state_IO_03_02
  SetCarState(lidar_rt_car_state_IO_03_02, cnt);
  filename = GetFileName(\"lidar_rt_car_state_IO_03_02\", timestamp);
  SaveCarState(lidar_rt_car_state_IO_03_02, filename);

  // lidar_rt_pc_correct_set
  SetLidarPCAcorrect_set(lidar_rt_pc_correct_set, cnt);
  filename = GetFileName(\"lidar_rt_pc_correct_set\", timestamp);
  SaveLidarPCAcorrect_set(lidar_rt_pc_correct_set, filename);

  // lidar_lt_pc_set
  SetLidarPCA_set(lidar_lt_pc_set, cnt);
  filename = GetFileName(\"lidar_lt_pc_set\", timestamp);
  SaveLidarPCA_set(lidar_lt_pc_set, filename);

  // lidar_lt_car_state_IO_03_02
  SetCarState(lidar_lt_car_state_IO_03_02, cnt);
  filename = GetFileName(\"lidar_lt_car_state_IO_03_02\", timestamp);
  SaveCarState(lidar_lt_car_state_IO_03_02, filename);

  // lidar_lt_pc_correct_set
  SetLidarPCAcorrect_set(lidar_lt_pc_correct_set, cnt);
  filename = GetFileName(\"lidar_lt_pc_correct_set\", timestamp);
  SaveLidarPCAcorrect_set(lidar_lt_pc_correct_set, filename);

  // io_52_04_rob_trigger_data
  SetRoBTrigger(io_52_04_rob_trigger_data, cnt);
  filename = GetFileName(\"io_52_04_rob_trigger_data\", timestamp);
  SaveRoBTrigger(io_52_04_rob_trigger_data, filename);

  // ads_pln_trajectory_data
  SetIhvTrajectoryData(ads_pln_trajectory_data, cnt);
  filename = GetFileName(\"ads_pln_trajectory_data\", timestamp);
  SaveIhvTrajectoryData(ads_pln_trajectory_data, filename);

  // fsn_objects_array_rcg_03_17
  SetFusionObject_array(fsn_objects_array_rcg_03_17, cnt);
  filename = GetFileName(\"fsn_objects_array_rcg_03_17\", timestamp);
  SaveFusionObject_array(fsn_objects_array_rcg_03_17, filename);

  // car_state_FusionObject_ObjectLanePos_ObjectNotExistRegion
  SetCarState(car_state_FusionObject_ObjectLanePos_ObjectNotExistRegion, cnt);
  filename = GetFileName(
      \"car_state_FusionObject_ObjectLanePos_ObjectNotExistRegion\", timestamp);
  SaveCarState(car_state_FusionObject_ObjectLanePos_ObjectNotExistRegion,
               filename);

#if 0
" . 906) ((marker . 484) . -157) ((marker . 484) . -157) ((marker . 444) . -107) ((marker . 444) . -107) ((marker . 488) . -194) ((marker . 488) . -194) ((marker . 681) . -370) ((marker . 681) . -370) ((marker . 761) . -15) ((marker . 761) . -15) ((marker . 523) . -262) ((marker . 523) . -262) ((marker . 21) . -15) ((marker . 1400) . -5221) ((marker . 491) . -217) ((marker . 491) . -217) ((marker . 602) . -319) ((marker . 602) . -319) ((marker . 490) . -195) ((marker . 490) . -195) ((marker) . -5221) nil (" " . 6127) nil ("    SystemStateData *systemstate_data,                  // output
    CarState *car_state,                                // output
    ImageData_adx_rec *locator_camera_image,            // output
    TeleImageData_adx_rec *IO_54_02_tele_camera_image,  // output
    IncmImageData *incm_camera_image,                   // output
    ImageData *driver_monitor_image_dummy,              // output
    DMC *fot_data_collect_dmc_data,                     // output
    DriverData *fot_data_collect_driver_data,           // output
    PCS *io_52_04_pcs_data,                             // output
    PCS2 *io_52_04_pcs2_data,                           // output
    LidarPCData_set *lidar_fr_pc_set,                   // output
    CarState *lidar_fr_car_state_IO_03_02,              // output
    LidarPCA_set *lidar_rr_pc_set,                      // output
    CarState *lidar_rr_car_state_IO_03_02,              // output
    LidarPCAcorrect_set *lidar_rr_pc_correct_set,       // output
    LidarPCA_set *lidar_rt_pc_set,                      // output
    CarState *lidar_rt_car_state_IO_03_02,              // output
    LidarPCAcorrect_set *lidar_rt_pc_correct_set,       // output
    LidarPCA_set *lidar_lt_pc_set,                      // output
    CarState *lidar_lt_car_state_IO_03_02,              // output
    LidarPCAcorrect_set *lidar_lt_pc_correct_set,       // output
    RoBTrigger *io_52_04_rob_trigger_data,              // output
    IhvTrajectoryData *ads_pln_trajectory_data,         // output
    FusionObject_array *fsn_objects_array_rcg_03_17,    // output
    CarState
        *car_state_FusionObject_ObjectLanePos_ObjectNotExistRegion,  // output
" . -523) ((marker . 1) . -1676) ((marker . 1) . -462) ((marker . 484) . -1518) ((marker . 484) . -1518) ((marker . 444) . -528) ((marker . 444) . -528) ((marker . 443) . -1452) ((marker . 443) . -1452) ((marker . 488) . -1254) ((marker . 488) . -1254) ((marker . 261) . -1676) ((marker . 261) . -1676) ((marker . 441) . -990) ((marker . 441) . -990) ((marker . 681) . -1386) ((marker . 681) . -1386) ((marker . 761) . -792) ((marker . 761) . -792) ((marker . 523) . -462) ((marker . 523) . -462) ((marker . 728) . -594) ((marker . 728) . -594) ((marker . 1) . -1676) ((marker . 491) . -660) ((marker . 491) . -660) ((marker) . -1676) ((marker . 602) . -858) ((marker . 602) . -858) 2199 nil ("#include \"SetRoBTrigger.h\"
#include \"SetSystemStateData.h\"
#include \"SetTeleImageData_adx_rec.h\"
" . -72) ((marker . 1) . -97) ((marker . 72) . -26) ((marker . 375) . -97) ((marker . 375) . -97) ((marker . 372) . -27) ((marker . 372) . -27) ((marker . 144) . -59) ((marker . 144) . -59) ((marker . 1) . -97) ((marker) . -97) 169 nil (169 . 170) nil ("
" . 169) ((marker . 21) . -1) nil ("include \"SetCarState.h\"
#include \"SetDMC.h\"
#include \"SetDriverData.h\"
#include \"SetFusionObject_array.h\"
#include \"SetIhvTrajectoryData.h\"
#include \"SetImageData.h\"
#include \"SetImageData_adx_rec.h\"
#include \"SetIncmImageData.h\"
#include \"SetLidarPCA_set.h\"
#include \"SetLidarPCAcorrect_set.h\"
#include \"SetLidarPCData_set.h\"
#include \"SetLocatorCameraImage.h\"
#include \"SetPCS.h\"
#include \"SetPCS2.h\"
" . -39) ((marker . 1) . -403) ((marker . 72) . -44) ((marker . 72) . -70) ((marker . 484) . -230) ((marker . 484) . -230) ((marker . 443) . -382) ((marker . 443) . -382) ((marker . 488) . -24) ((marker . 488) . -24) ((marker . 261) . -259) ((marker . 261) . -259) ((marker . 681) . -166) ((marker . 681) . -166) ((marker . 372) . -106) ((marker . 372) . -106) ((marker . 437) . -44) ((marker . 437) . -44) ((marker . 1) . -403) ((marker) . -403) 442 nil ("#" . 39) nil ("#" . 443) (t 23423 26533 471131 0)))
