
((digest . "b91f44c1dfbaae59d24622a91bc0f913") (undo-list nil (11180 . 11182) ("  " . 11180) ((marker* . 11182) . 2) ((marker* . 11182) . 2) (11179 . 11180) nil (nil rear-nonsticky nil 11178 . 11179) (nil fontified nil 11178 . 11179) (nil fontified nil 11177 . 11178) (nil fontified nil 11176 . 11177) (nil fontified nil 11175 . 11176) (nil fontified nil 11174 . 11175) (nil fontified nil 11173 . 11174) (nil fontified nil 11172 . 11173) (nil fontified nil 11171 . 11172) (nil fontified nil 11170 . 11171) (nil fontified nil 11169 . 11170) (nil fontified nil 11168 . 11169) (nil fontified nil 11167 . 11168) (nil fontified nil 11166 . 11167) (nil fontified nil 11165 . 11166) (nil fontified nil 11164 . 11165) (nil fontified nil 11163 . 11164) (nil fontified nil 11162 . 11163) (nil fontified nil 11161 . 11162) (nil fontified nil 11160 . 11161) (nil fontified nil 11159 . 11160) (nil fontified nil 11158 . 11159) (nil fontified nil 11157 . 11158) (nil fontified nil 11156 . 11157) (nil fontified nil 11155 . 11156) (nil fontified nil 11154 . 11155) (nil fontified nil 11153 . 11154) (nil fontified nil 11152 . 11153) (nil fontified nil 11151 . 11152) (nil fontified nil 11150 . 11151) (nil fontified nil 11149 . 11150) (nil fontified nil 11148 . 11149) (nil fontified nil 11147 . 11148) (nil fontified nil 11146 . 11147) (nil fontified nil 11145 . 11146) (nil fontified nil 11144 . 11145) (nil fontified nil 11143 . 11144) (nil fontified nil 11142 . 11143) (nil fontified nil 11141 . 11142) (nil fontified nil 11140 . 11141) (nil fontified nil 11139 . 11140) (nil fontified nil 11138 . 11139) (nil fontified nil 11137 . 11138) (nil fontified nil 11136 . 11137) (nil fontified nil 11135 . 11136) (nil fontified nil 11134 . 11135) (nil fontified nil 11133 . 11134) (nil fontified nil 11132 . 11133) (nil fontified nil 11131 . 11132) (nil fontified nil 11130 . 11131) (nil fontified nil 11129 . 11130) (nil fontified nil 11127 . 11129) (11127 . 11179) nil (nil rear-nonsticky nil 7042 . 7043) (nil fontified nil 7042 . 7043) (nil fontified nil 7041 . 7042) (nil fontified nil 7040 . 7041) (nil fontified nil 7039 . 7040) (nil fontified nil 7038 . 7039) (nil fontified nil 7037 . 7038) (nil fontified nil 7036 . 7037) (nil fontified nil 7035 . 7036) (nil fontified nil 7034 . 7035) (nil fontified nil 7033 . 7034) (nil fontified nil 7032 . 7033) (nil fontified nil 7031 . 7032) (nil fontified nil 7030 . 7031) (nil fontified nil 7029 . 7030) (nil fontified nil 7028 . 7029) (nil fontified nil 7027 . 7028) (nil fontified nil 7026 . 7027) (nil fontified nil 7025 . 7026) (nil fontified nil 7024 . 7025) (nil fontified nil 7023 . 7024) (nil fontified nil 7022 . 7023) (nil fontified nil 7021 . 7022) (nil fontified nil 7020 . 7021) (nil fontified nil 7019 . 7020) (nil fontified nil 7018 . 7019) (nil fontified nil 7017 . 7018) (nil fontified nil 7016 . 7017) (nil fontified nil 7015 . 7016) (nil fontified nil 7014 . 7015) (nil fontified nil 7013 . 7014) (nil fontified nil 7012 . 7013) (nil fontified nil 7011 . 7012) (nil fontified nil 7010 . 7011) (nil fontified nil 7009 . 7010) (nil fontified nil 7008 . 7009) (nil fontified nil 7007 . 7008) (nil fontified nil 7006 . 7007) (nil fontified nil 7005 . 7006) (nil fontified nil 7004 . 7005) (nil fontified nil 7003 . 7004) (nil fontified nil 7002 . 7003) (nil fontified nil 7001 . 7002) (nil fontified nil 7000 . 7001) (nil fontified nil 6999 . 7000) (nil fontified nil 6998 . 6999) (nil fontified nil 6997 . 6998) (nil fontified nil 6996 . 6997) (nil fontified nil 6995 . 6996) (nil fontified nil 6994 . 6995) (nil fontified nil 6993 . 6994) (nil fontified nil 6991 . 6993) (6991 . 7043) nil ("  printf( \"has_id= %d is_fix = %d\\n\",has_id,is_fix);" . 6991) ((marker . 7043) . -2) nil ("
" . -7046) (7042 . 7047) nil (7041 . 7042) nil (7035 . 7041) nil (7034 . 7035) nil (7028 . 7034) nil (7027 . 7028) nil (7012 . 7027) nil ("," . -7012) ((marker . 7043) . -1) 7013 nil (7012 . 7013) nil (7011 . 7012) nil ("D" . -7011) ((marker . 7043) . -1) 7012 nil (7010 . 7012) nil ("$" . -7010) ((marker . 7043) . -1) 7011 nil (7005 . 7011) nil ("?" . -7005) ((marker . 7043) . -1) ("_" . -7006) ((marker . 7043) . -1) 7007 nil (7005 . 7007) nil ("?" . -7005) ((marker . 7043) . -1) 7006 nil (7000 . 7006) nil (6999 . 7000) nil (6993 . 6999) (t 23641 18180 349615 999000) nil (6926 . 11076) ("if (has_id) {
    listen_socket = server->init(my_ip, my_port, endian);
  } else {
    if (is_fix) {
      listen_socket = server->init(
          my_ip, my_port, endian, message_info_list_.at(message_index_list.at(0)).message_length);
    } else {
      listen_socket =
          server->init(my_ip,
                       my_port,
                       endian,
                       index_vs_structure.at(message_index_list.at(0)).payload_size_offset_,
                       index_vs_structure.at(message_index_list.at(0)).payload_size_size_,
                       index_vs_structure.at(message_index_list.at(0)).payload_offset_);
    }
  }

  if (listen_socket < 0) {
    printf(\"ERR: fail offline TCP server init\\n\");
    return false;
  }

  {
    std::lock_guard<std::mutex> lock(socket_vs_tcp_server_mtx_);
    socket_vs_tcp_server_[listen_socket] = server;
  }

  int recv_socket = server->accept();
  if (recv_socket < 0) {
    printf(\"ERR: fail offline TCP server accept\\n\");
    return false;
  }

  // receiveのジョブをpoll待ちに追加.
  Task task;
  task.job_ = std::bind(&OfflineTCPServer::receive, server, recv_socket, std::placeholders::_1);
  task.priority_ = 0;
  {
    std::lock_guard<std::mutex> lock(read_poll_mtx_);
    socket_vs_dump_reader_[recv_socket] = server->getDumpReaderPtr();
    socket_vs_read_task_[recv_socket]   = task;
  }
  {
    std::lock_guard<std::mutex> lock(socket_vs_is_processing_mtx_);
    socket_vs_is_processing_.emplace(recv_socket, false);
  }

  // 受信メッセージキューの作成 //
  // socketは、recv_socketで初期化する
  createReceiveMessageQueue(recv_socket, message_index_list);
  return true;
}

void OfflineEthCommunicator::updateTcpServerMessage(
    const int recv_socket,
    const int listen_socket,
    const bool has_message_id,
    const std::vector<uint32_t>& message_id_list,
    const std::vector<std::vector<char>>& payload_list,
    const bool is_receive_complete) {
  updateTcpMessage(true,
                   recv_socket,
                   listen_socket,
                   has_message_id,
                   message_id_list,
                   payload_list,
                   is_receive_complete);
}

/////////////// TCP 共通関数 /////////////////
void OfflineEthCommunicator::updateTcpMessage(const bool /*is_server*/,
                                              const int recv_socket,
                                              const int /*listen_socket*/,
                                              const bool has_message_id,
                                              const std::vector<uint32_t>& message_id_list,
                                              const std::vector<std::vector<char>>& payload_list,
                                              const bool is_receive_complete) {
  {
    std::lock_guard<std::mutex> lock(socket_vs_is_processing_mtx_);
    socket_vs_is_processing_.at(recv_socket) = false;
    socket_vs_is_processing_condition_.notify_all();
  }
  if (is_receive_complete) {
    // パケットの受信が完了している場合はMessageのアップデートを行う
    for (size_t index = 0; index < message_id_list.size(); ++index) {
      updateReceiveMessage(
          recv_socket, has_message_id, message_id_list.at(index), payload_list.at(index));
    }
  }
}

/////////////// UDP SERVER /////////////////
bool OfflineEthCommunicator::addUdpServer(
    const std::string& my_ip,
    const uint16_t my_port,
    const EthCommunicationType communication_type,
    const std::vector<size_t>& message_index_list,
    const MessageInfoIndexVsNonMsgIdVariableStructure& index_vs_structure) {
  std::shared_ptr<OfflineUDPServer> server = std::make_shared<OfflineUDPServer>();
  server->setObserver(this);

  // 1つのメッセージからmessage_idの有無とendianを取得する(メッセージにより変わらないはずの情報)
  bool has_id     = message_info_list_.at(message_index_list.at(0)).has_id;
  bool is_fix     = message_info_list_.at(message_index_list.at(0)).is_fix;
  Endian endian   = message_info_list_.at(message_index_list.at(0)).endian;
  uint16_t period = getShortestPeriod(message_index_list);

  int server_socket;" . 6926) ((marker . 7043) . -12) ((marker) . -3956) ((marker) . -3956) ((marker) . -3527) 6828 (t 23641 18065 949615 999000) nil (6926 . 10935) ("printf( \"TCP:my_ip= %s my_port= %d\\n\", my_ip.c_str() , my_port);
  
  if (has_id) {
    listen_socket = server->init(my_ip, my_port, endian);
  } else {
    if (is_fix) {
      listen_socket = server->init(
          my_ip, my_port, endian, message_info_list_.at(message_index_list.at(0)).message_length);
    } else {
      listen_socket =
          server->init(my_ip,
                       my_port,
                       endian,
                       index_vs_structure.at(message_index_list.at(0)).payload_size_offset_,
                       index_vs_structure.at(message_index_list.at(0)).payload_size_size_,
                       index_vs_structure.at(message_index_list.at(0)).payload_offset_);
    }
  }

  if (listen_socket < 0) {
    printf(\"ERR: fail offline TCP server init\\n\");
    return false;
  }

  {
    std::lock_guard<std::mutex> lock(socket_vs_tcp_server_mtx_);
    socket_vs_tcp_server_[listen_socket] = server;
  }

  int recv_socket = server->accept();
  if (recv_socket < 0) {
    printf(\"ERR: fail offline TCP server accept\\n\");
    return false;
  }

  // receiveのジョブをpoll待ちに追加.
  Task task;
  task.job_ = std::bind(&OfflineTCPServer::receive, server, recv_socket, std::placeholders::_1);
  task.priority_ = 0;
  {
    std::lock_guard<std::mutex> lock(read_poll_mtx_);
    socket_vs_dump_reader_[recv_socket] = server->getDumpReaderPtr();
    socket_vs_read_task_[recv_socket]   = task;
  }
  {
    std::lock_guard<std::mutex> lock(socket_vs_is_processing_mtx_);
    socket_vs_is_processing_.emplace(recv_socket, false);
  }

  // 受信メッセージキューの作成 //
  // socketは、recv_socketで初期化する
  createReceiveMessageQueue(recv_socket, message_index_list);
  return true;
}

void OfflineEthCommunicator::updateTcpServerMessage(
    const int recv_socket,
    const int listen_socket,
    const bool has_message_id,
    const std::vector<uint32_t>& message_id_list,
    const std::vector<std::vector<char>>& payload_list,
    const bool is_receive_complete) {
  updateTcpMessage(true,
                   recv_socket,
                   listen_socket,
                   has_message_id,
                   message_id_list,
                   payload_list,
                   is_receive_complete);
}

/////////////// TCP 共通関数 /////////////////
void OfflineEthCommunicator::updateTcpMessage(const bool /*is_server*/,
                                              const int recv_socket,
                                              const int /*listen_socket*/,
                                              const bool has_message_id,
                                              const std::vector<uint32_t>& message_id_list,
                                              const std::vector<std::vector<char>>& payload_list,
                                              const bool is_receive_complete) {
  {
    std::lock_guard<std::mutex> lock(socket_vs_is_processing_mtx_);
    socket_vs_is_processing_.at(recv_socket) = false;
    socket_vs_is_processing_condition_.notify_all();
  }
  if (is_receive_complete) {
    // パケットの受信が完了している場合はMessageのアップデートを行う
    for (size_t index = 0; index < message_id_list.size(); ++index) {
      updateReceiveMessage(
          recv_socket, has_message_id, message_id_list.at(index), payload_list.at(index));
    }
  }
}

/////////////// UDP SERVER /////////////////
bool OfflineEthCommunicator::addUdpServer(
    const std::string& my_ip,
    const uint16_t my_port,
    const EthCommunicationType communication_type,
    const std::vector<size_t>& message_index_list,
    const MessageInfoIndexVsNonMsgIdVariableStructure& index_vs_structure) {
  std::shared_ptr<OfflineUDPServer> server = std::make_shared<OfflineUDPServer>();
  server->setObserver(this);

  // 1つのメッセージからmessage_idの有無とendianを取得する(メッセージにより変わらないはずの情報)
  bool has_id     = message_info_list_.at(message_index_list.at(0)).has_id;
  bool is_fix     = message_info_list_.at(message_index_list.at(0)).is_fix;
  Endian endian   = message_info_list_.at(message_index_list.at(0)).endian;
  uint16_t period = getShortestPeriod(message_index_list);

  int server_socket;

  printf( \"UDP:my_ip= %s my_port= %d\\n\", my_ip.c_str() , my_port);
  " . 6926) ((marker . 7043) . -13) ((marker . 7043) . -718) ((marker . 6589) . -718) ((marker . 11127) . -4081) ((marker* . 11182) . 4067) ((marker* . 11182) . 4067) ((marker) . -4096) ((marker) . -4096) ((marker) . -3597) ((marker . 11180) . -718) ((marker . 11183) . -745) 7245 (t 23641 15591 601615 999000) nil (6938 . 6939) nil (6935 . 6938) nil (11017 . 11018) nil (11014 . 11017) nil (11065 . 11068) nil (nil rear-nonsticky nil 11064 . 11065) (nil fontified nil 11064 . 11065) (nil fontified nil 11063 . 11064) (nil fontified nil 11056 . 11063) (nil fontified nil 11055 . 11056) (nil fontified nil 11054 . 11055) (nil fontified nil 11053 . 11054) (nil fontified nil 11052 . 11053) (nil fontified nil 11051 . 11052) (nil fontified nil 11050 . 11051) (nil fontified nil 11049 . 11050) (nil fontified nil 11048 . 11049) (nil fontified nil 11047 . 11048) (nil fontified nil 11046 . 11047) (nil fontified nil 11045 . 11046) (nil fontified nil 11044 . 11045) (nil fontified nil 11043 . 11044) (nil fontified nil 11042 . 11043) (nil fontified nil 11041 . 11042) (nil fontified nil 11040 . 11041) (nil fontified nil 11039 . 11040) (nil fontified nil 11038 . 11039) (nil fontified nil 11037 . 11038) (nil fontified nil 11036 . 11037) (nil fontified nil 11035 . 11036) (nil fontified nil 11034 . 11035) (nil fontified nil 11033 . 11034) (nil fontified nil 11032 . 11033) (nil fontified nil 11031 . 11032) (nil fontified nil 11030 . 11031) (nil fontified nil 11029 . 11030) (nil fontified nil 11028 . 11029) (nil fontified nil 11027 . 11028) (nil fontified nil 11026 . 11027) (nil fontified nil 11025 . 11026) (nil fontified nil 11024 . 11025) (nil fontified nil 11023 . 11024) (nil fontified nil 11022 . 11023) (nil fontified nil 11021 . 11022) (nil fontified nil 11020 . 11021) (nil fontified nil 11019 . 11020) (nil fontified nil 11018 . 11019) (nil fontified nil 11017 . 11018) (nil fontified nil 11016 . 11017) (nil fontified nil 11015 . 11016) (nil fontified nil 11014 . 11015) (nil fontified nil 11013 . 11014) (nil fontified nil 11012 . 11013) (nil fontified nil 11011 . 11012) (nil fontified nil 11010 . 11011) (nil fontified nil 11009 . 11010) (nil fontified nil 11008 . 11009) (nil fontified nil 11007 . 11008) (nil fontified nil 11006 . 11007) (nil fontified nil 11005 . 11006) (nil fontified nil 11003 . 11005) (11003 . 11065) nil ("./ads_rapid . ../../ads_rapid/etc/param/car_param_700w-no5.json --off dump/20181121_134238/" . 11003) nil (nil rear-nonsticky nil 11093 . 11094) (nil fontified nil 11003 . 11094) (11003 . 11094) nil (11004 . 11006) ("  " . 11003) ((marker) . -2) (11005 . 11006) (11002 . 11003) (t 23641 15476 501615 999000) nil (6972 . 6974) nil (6968 . 6972) nil ("s" . -6968) ((marker . 7043) . -1) 6969 nil (6966 . 6969) nil ("." . -6944) ((marker . 7043) . -1) ("c" . -6945) ((marker . 7043) . -1) ("_" . -6946) ((marker . 7043) . -1) ("s" . -6947) ((marker . 7043) . -1) ("t" . -6948) ((marker . 7043) . -1) ("r" . -6949) ((marker . 7043) . -1) ("(" . -6950) ((marker . 7043) . -1) ((marker) . -1) ((marker*) . 1) ((marker) . -1) (")" . -6951) ((marker . 7043) . -1) ((marker*) . 1) ((marker) . -1) 6952 nil (6950 . 6952) nil (6944 . 6950) nil ("/" . -6944) ((marker . 7043) . -1) ("." . -6945) ((marker . 7043) . -1) 6946 nil (6945 . 6946) nil (6944 . 6945) nil ("/" . -6944) ((marker . 7043) . -1) ("c" . -6945) ((marker . 7043) . -1) ("_" . -6946) ((marker . 7043) . -1) ("s" . -6947) ((marker . 7043) . -1) ("t" . -6948) ((marker . 7043) . -1) ("r" . -6949) ((marker . 7043) . -1) 6950 nil (6945 . 6950) nil (6944 . 6945) (t 23641 15290 881615 999000) nil (" << endl;" . 6978) nil (6977 . 6978) nil ("l" . -6977) ((marker . 7043) . -1) 6978 nil (6977 . 6978) nil (6976 . 6977) nil (6967 . 6968) nil ("<< \"my_port=\" <<" . 6967) ((marker . 7043) . -16) ((marker) . -16) 6983 nil (6959 . 6960) nil (6956 . 6958) nil ("<<" . -6957) ((marker . 7043) . -2) ((marker) . -2) 6959 nil (6953 . 6954) nil (6944 . 6955) nil (6941 . 6944) nil ("cout <<" . -6933) ((marker . 7043) . -7) ((marker) . -7) 6940 nil (6932 . 6933) nil (6926 . 6932) (t 23641 15239 925615 999000) nil ("s" . -6979) ((marker . 7043) . -1) ("t" . -6980) ((marker . 7043) . -1) ("d" . -6981) ((marker . 7043) . -1) (":" . -6982) ((marker . 7043) . -1) (":" . -6983) ((marker . 7043) . -1) 6984 nil ("s" . -6926) ((marker . 7043) . -1) ("t" . -6927) ((marker . 7043) . -1) ("d" . -6928) ((marker . 7043) . -1) (":" . -6929) ((marker . 7043) . -1) (":" . -6930) ((marker . 7043) . -1) 6931 (t 23641 15212 217615 999000) nil (6936 . 6938) nil (6935 . 6936) (t 23641 15128 165615 999000) nil ("
" . -6994) (6990 . 6995) nil ("l" . -6990) ((marker . 7043) . -1) 6991 nil (6986 . 6991) nil (6984 . 6986) nil (6980 . 6984) nil (6978 . 6980) nil (6977 . 6978) nil (6970 . 6977) ("my_por" . -6970) ((marker . 7043) . -6) 6976 nil (6970 . 6976) nil (6969 . 6970) nil (6967 . 6969) nil (6955 . 6956) nil (6953 . 6955) nil (6952 . 6953) nil ("," . -6952) ((marker . 7043) . -1) ((marker . 11127) . -1) 6953 nil (6946 . 6947) nil (6944 . 6946) nil ("," . -6944) ((marker . 7043) . -1) 6945 nil ("," . -6962) ((marker . 7043) . -1) 6963 nil (6962 . 6963) nil (6961 . 6962) nil ("%" . -6961) ((marker . 7043) . -1) ("\\" . -6962) ((marker . 7043) . -1) ("n" . -6963) ((marker . 7043) . -1) ("\"" . -6964) ((marker . 7043) . -1) 6965 nil (6960 . 6961) nil ("," . -6952) ((marker . 7043) . -1) 6953 nil (6951 . 6952) nil ("%s" . -6951) ((marker . 7043) . -2) ((marker) . -2) 6953 nil (6950 . 6951) nil (6945 . 6950) nil (6944 . 6945) nil (6943 . 6944) nil (6935 . 6936) nil ("p" . -6935) ((marker . 7043) . -1) ("r" . -6936) ((marker . 7043) . -1) ("i" . -6937) ((marker . 7043) . -1) ("n" . -6938) ((marker . 7043) . -1) ("t" . -6939) ((marker . 7043) . -1) ("f" . -6940) ((marker . 7043) . -1) ("(" . -6941) ((marker . 7043) . -1) 6942 nil (6931 . 6935) nil (6924 . 6926) (" " . 6924) (6929 . 6930) (6924 . 6925) ("  " . 6924) (6929 . 6930) nil (6926 . 6929) nil (6950 . 6952) nil (6943 . 6950) nil (6943 . 6945) nil (6943 . 6944) nil (6942 . 6943) nil (6933 . 6942) nil ("'" . -6933) ((marker . 7043) . -1) 6934 nil (6933 . 6934) nil (6932 . 6933) nil (6926 . 6932) nil (6923 . 6926) (t 23626 56306 254803 0)))
