module IVLE
  module Webcast
    def webcasts(course_id, duration=0, media_channel_id=nil)
      optionals = media_channel_id.nil? ? {} : { mediachannelid: media_channel_id }
      api 'Webcasts', { courseid: course_id, duration: duration }.merge(optionals)
    end

    def webcast_add_log(media_channel_id, media_channel_item_id)
      # Docs are bad
      api_post 'Webcast_AddLog_JSON', mediachannelid: media_channel_id, mediachannelitemid: media_channel_item_id
    end
  end
end
