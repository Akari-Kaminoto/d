
((digest . "23b130935f77714ef36585e1eebe3ae3") (undo-list nil ("


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
" . -4552) ((marker . 4077) . -747) ((marker . 4077) . -747) ((marker . 3987) . -713) ((marker . 3987) . -713) ((marker . 3939) . -672) ((marker . 4552) . -672) ((marker . 4384) . -807) ((marker . 4163) . -752) ((marker . 4163) . -752) ((marker . 4237) . -805) ((marker . 4237) . -805) ((marker . 4255) . -807) ((marker . 4255) . -807) ((marker . 4208) . -777) ((marker . 4208) . -777) ((marker . 4120) . -751) ((marker . 4120) . -751) ((marker . 4035) . -741) ((marker . 4035) . -741) ((marker . 4458) . -672) ((marker . 4458) . -672) ((marker) . -805) ((marker . 4552) . -3) ((marker) . -807) ((marker . 4552) . -514) ((marker* . 4552) . 283) ((marker* . 4552) . 804) ((marker . 4552) . -524) ((marker* . 4552) . 223) ((marker* . 4552) . 804) ((marker . 4552) . -584) ((marker* . 4552) . 180) ((marker* . 4552) . 804) ((marker . 4552) . -627) ((marker* . 4552) . 135) ((marker* . 4552) . 804) ((marker . 4552) . -672) ((marker* . 4552) . 135) ((marker* . 4552) . 135) ((marker . 4552) . -672) ((marker . 4552) . -672) ((marker . 4552) . -672) ((marker* . 4552) . 94) ((marker* . 4552) . 135) ((marker . 4552) . -672) ((marker . 4552) . -713) ((marker* . 4552) . 66) ((marker* . 4552) . 94) ((marker . 4552) . -672) ((marker . 4552) . -741) ((marker* . 4552) . 60) ((marker* . 4552) . 66) ((marker . 4552) . -672) ((marker . 4552) . -747) ((marker* . 4552) . 56) ((marker* . 4552) . 60) ((marker . 4552) . -672) ((marker . 4552) . -751) ((marker* . 4552) . 55) ((marker* . 4552) . 56) ((marker . 4552) . -672) ((marker . 4552) . -752) ((marker* . 4552) . 30) ((marker* . 4552) . 55) ((marker . 4552) . -672) ((marker . 4552) . -777) ((marker* . 4552) . 2) ((marker* . 4552) . 30) ((marker . 4552) . -672) ((marker . 4552) . -805) ((marker* . 4552) . 2) ((marker . 4552) . -672) ((marker . 4384) . -807) ((marker . 4552) . -807) 5359 (t 23561 57581 301001 0) nil (18929 . 18930) nil (18927 . 18929) nil (23241 . 23243) (t 23561 56375 145001 0) nil ("/" . 23241) ("/" . 23241) (t 23561 56283 613001 0) nil undo-tree-canary))
