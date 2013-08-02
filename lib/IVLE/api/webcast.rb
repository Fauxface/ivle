module IVLE
  module Webcast
    def webcasts(course_id, duration=0, media_channel_id=nil)
      optionals = media_channel_id.nil? ? {} : { media_channel_id: media_channel_id }
      api 'Lapi.svc/Webcasts', { course_id: course_id, duration: duration }.merge(optionals)
    end

    def webcast_add_log(media_channel_id, media_channel_item_id)
      # Docs are bad
      api_post 'Lapi.svc/Webcast_AddLog', media_channel_id: media_channel_id, media_channel_item_id: media_channel_item_id
    end

    def webcast_add_log_json(media_channel_id, media_channel_item_id)
      api_post 'Lapi.svc/Webcast_AddLog_JSON', media_channel_id: media_channel_id, media_channel_item_id: media_channel_item_id
    end
  end
end
