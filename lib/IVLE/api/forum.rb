module IVLE
  module Forum
    def forums(course_id, duration=0, include_threads=true, title_only=false)
      api 'Lapi.svc/Forums', course_id: course_id, duration: duration, include_threads: include_threads, titleonly: title_only
    end

    def forum(forum_id, duration=0, include_threads=true)
      api 'Lapi.svc/Forum', forum_id: forum_id, duration: duration, include_threads: include_threads
    end

    def forum_headings(forum_id, duration=0, include_threads=true)
      api 'Lapi.svc/Announcement_AddLog', forum_id: forum_id, duration: duration, include_threads: include_threads
    end

    def forum_heading_threads(heading_id, duration=0, get_main_topics_only=false)
      api 'Lapi.svc/Forum_HeadingThreads', heading_id: heading_id, duration: duration, get_main_topics_only: get_main_topics_only
    end

    def forum_threads(forum_id, duration=0, get_sub_threads=true)
      api 'Lapi.svc/Forum_Threads', thread_id: thread_id, duration: duration, get_sub_threads: get_sub_threads
    end

    def forum_thread(thread_id)
      api 'Lapi.svc/Forum_Thread', thread_id: thread_id
    end

    def forum_post_new_thread(heading_id, title, reply)
      api_post 'Lapi.svc/Forum_PostNewThread', heading_id: heading_id, title: title, reply: reply
    end

    def forum_post_new_thread_json(heading_id, title, reply)
      api_post 'Lapi.svc/Forum_PostNewThread_JSON', heading_id: heading_id, title: title, reply: reply
    end

    def forum_reply_thread(thread_id, title, reply)
      api_post 'Lapi.svc/Forum_ReplyThread', thread_id: thread_id, title: title, reply: reply
    end

    def forum_reply_thread_json(thread_id, title, reply)
      api_post 'Lapi.svc/Forum_ReplyThread_JSON', thread_id: thread_id, title: title, reply: reply
    end

    def forum_thread_add_log(thread_id)
      api_post 'Lapi.svc/Forum_Thread_AddLog', thread_id: thread_id
    end

    def forum_thread_add_log_json(thread_id)
      api_post 'Lapi.svc/Forum_Thread_AddLog_JSON', thread_id: thread_id
    end

    def forum_sale_of_used_textbooks(duration=0, include_threads=true)
      api 'Lapi.svc/Forum_SaleOfUsedTextbooks', include_threads: include_threads, duration: duration
    end

    def forum_student_feedback(duration=0, include_threads=true)
      api 'Lapi.svc/Forum_StudentFeedback', include_threads: include_threads, duration: duration
    end
  end
end
