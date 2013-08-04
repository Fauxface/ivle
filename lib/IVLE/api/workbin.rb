module IVLE
  module Workbin
    def workbins(course_id, duration=0, workbin_id=nil, title_only=false)
      api 'Workbins', courseid: course_id, duration: duration, workbinid: workbin_id, titleonly: title_only
    end

    def download_file(id)
      api 'downloadfile', id: id
    end
  end
end
