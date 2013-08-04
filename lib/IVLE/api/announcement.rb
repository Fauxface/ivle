module IVLE
  module Announcement
    def announcements(course_id, duration=0, title_only=false)
      api 'Announcements', courseid: course_id, duration: duration, titleonly: title_only
    end

    def announcements_unread(title_only=false)
      api 'Announcements_Unread'
    end

    def announcement_add_log(ann_event_id)
      api_post 'Announcement_AddLog_JSON', anneventid: ann_event_id
    end

    def announcement_add(course_id, ann_title, ann_message, send_email)
      api_post 'Announcement_Add_JSON', courseid: course_id, anntitle: ann_title, annmessage: ann_message, sendemail: send_email
    end
  end
end
