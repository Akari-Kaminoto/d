
((digest . "1cdeb75c47b090d2b15406dceea23a92") (undo-list nil (">>>>>>> 5eca1b3d5f5122fc410b918f353e586229443413
" . -1373) ((marker . 12755) . -49) ((marker . 12755) . -49) ((marker) . -49) 1422 nil ("<<<<<<< HEAD
  assert(cnt_ < kCacheSize);
  //
  printf(\"head_=%d , queue_[%d] =%p , cache_data = %p,sizeof(*cache_data)=%d\\n\",
      head_,head_,queue_[head_],cache_data,sizeof(*cache_data));
  fflush(stdout);
  //
  memcpy(queue_[head_], cache_data, sizeof(*cache_data));
  int ret = head_;
  head_ = (head_ + 1) % kCacheSize;
  cnt_++;
  return ret;
=======
" . -1339) ((marker . 1448) . -42) ((marker . 12755) . -361) ((marker . 12395) . -274) ((marker . 12395) . -274) ((marker . 12424) . -128) ((marker . 12424) . -128) ((marker . 12753) . -329) ((marker . 12753) . -329) ((marker . 12646) . -353) ((marker . 12646) . -353) ((marker . 12597) . -361) ((marker . 12597) . -361) ((marker . 12450) . -193) ((marker . 12450) . -193) ((marker) . -47) ((marker) . -47) ((marker . 12755) . -293) ((marker . 12755) . -293) ((marker . 12706) . -339) ((marker . 12706) . -339) ((marker . 12755) . -361) ((marker) . -361) 1700 nil (" " . 1700) nil ("
" . 954) ((marker . 12424) . -1) ((marker . 12424) . -1) ((marker* . 954) . 1) ((marker* . 954) . 1) ((marker . 12756) . -1) nil (">>>>>> 5eca1b3d5f5122fc410b918f353e586229443413" . 954) ((marker* . 954) . 47) ((marker* . 954) . 47) nil (">" . 954) ((marker* . 954) . 1) ((marker* . 954) . 1) nil ("<<<<<<< HEAD
      char* memptr = raw_memory_block;
      for (size_t i = 0; i < kCacheSize; ++i) {
        queue_[i] = reinterpret_cast<CacheData*>(memptr);
        //
        printf(\"queue_[%d] = %p\\n\",i,queue_[i]);
        //
        memptr += sizeof(*queue_[i]);
      }
=======
" . -902) ((marker . 1448) . -12) ((marker . 12755) . -283) ((marker) . -283) ((marker) . -283) ((marker) . -275) ((marker) . -275) ((marker . 12392) . -229) ((marker . 12392) . -229) ((marker . 12395) . -100) ((marker . 12395) . -100) ((marker . 12753) . -13) ((marker . 12753) . -13) ((marker) . -267) ((marker) . -267) ((marker . 12450) . -218) ((marker . 12450) . -218) ((marker . 12755) . -52) ((marker . 12755) . -52) ((marker . 12755) . -283) ((marker) . -283) 1185 (t 23421 3116 71452 0)))
