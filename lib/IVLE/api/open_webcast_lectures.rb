module IVLE
  module OpenWebcastLectures
    def open_webcasts(acad_year, semester, title_only=false, media_channel_id=nil)
      params = { acadyear: acad_year, semester: semester, titleonly: title_only }
      params.merge!({ mediachannelid: media_channel_id }) unless media_channel_id.nil?
      api 'OpenWebcasts', params
    end

    def open_webcast_add_log(media_channel_id, media_channel_item_id)
      api_post 'OpenWebcast_AddLog_JSON', mediachannelid: media_channel_id, mediachannelitemid: media_channel_item_id
    end
  end
end
