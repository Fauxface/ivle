module IVLE
  module Announcement
    def announcements(course_id, duration=0, title_only=false)
      api 'Lapi.svc/Announcements', course_id: course_id, duration: duration, title_only: title_only
    end

    def announcements_unread(title_only=false)
      api 'Lapi.svc/Announcements_Unread'
    end

    def announcement_add_log(ann_event_id)
      api_post 'Lapi.svc/Announcement_AddLog', ann_event_id: ann_event_id
    end

    def announcement_add_log_json(ann_event_id)
      api_post 'Lapi.svc/Announcement_AddLog_JSON', ann_event_id: ann_event_id
    end

    def announcement_add(course_id, ann_title, ann_message, send_email)
      api_post 'Lapi.svc/Announcement_Add', course_id: course_id, ann_title: ann_title, ann_message: ann_message, send_email: send_email
    end

    def announcement_add_json(course_id, ann_title, ann_message, send_email)
      api_post 'Lapi.svc/Announcement_Add_JSON', course_id: course_id, ann_title: ann_title, ann_message: ann_message, send_email: send_email
    end
  end
end
