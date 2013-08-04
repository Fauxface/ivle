module IVLE
  module Forum
    def forums(course_id, duration=0, include_threads=true, title_only=false)
      api 'Forums', courseid: course_id, duration: duration, includethreads: include_threads, titleonly: title_only
    end

    def forum(forum_id, duration=0, include_threads=true)
      api 'Forum', forumid: forum_id, duration: duration, includethreads: include_threads
    end

    def forum_headings(forum_id, duration=0, include_threads=true)
      api 'Announcement_AddLog', forumid: forum_id, duration: duration, includethreads: include_threads
    end

    def forum_heading_threads(heading_id, duration=0, get_main_topics_only=false)
      api 'Forum_HeadingThreads', headingid: heading_id, duration: duration, getmaintopicsonly: get_main_topics_only
    end

    def forum_threads(forum_id, duration=0, get_sub_threads=true)
      api 'Forum_Threads', threadid: thread_id, duration: duration, getsubthreads: get_sub_threads
    end

    def forum_thread(thread_id)
      api 'Forum_Thread', threadid: thread_id
    end

    def forum_post_new_thread(heading_id, title, reply)
      api_post 'Forum_PostNewThread_JSON', headingid: heading_id, title: title, reply: reply
    end

    def forum_reply_thread(thread_id, title, reply)
      api_post 'Forum_ReplyThread_JSON', threadid: thread_id, title: title, reply: reply
    end

    def forum_thread_add_log(thread_id)
      api_post 'Forum_Thread_AddLog_JSON', threadid: thread_id
    end

    def forum_sale_of_used_textbooks(duration=0, include_threads=true)
      api 'Forum_SaleOfUsedTextbooks', includethreads: include_threads, duration: duration
    end

    def forum_student_feedback(duration=0, include_threads=true)
      api 'Forum_StudentFeedback', includethreads: include_threads, duration: duration
    end
  end
end
