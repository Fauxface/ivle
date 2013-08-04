module IVLE
  module Gradebook
    def workbins(course_id)
      api 'Gradebook_ViewItems', courseid: course_id
    end
  end
end
