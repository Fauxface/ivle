module IVLE
  module Timetable
    def timetable_student(acad_year, semester)
      api 'Timetable_Student', acadyear: acad_year, semester: semester
    end

    def timetable_module(course_id)
      api 'Timetable_Module', courseid: course_id
    end

    def timetable_student_module(course_id)
      api 'Timetable_Student_Module', courseid: course_id
    end

    def timetable_module_exam(course_id)
      api 'Timetable_ModuleExam', courseid: course_id
    end
  end
end
