module IVLE
  module IVLEModule
    def modules(duration=0, include_all_info=true)
      api 'Lapi.svc/Modules', duration: duration, include_all_info: include_all_info
    end

    def modules_staff(duration=0, include_all_info=true)
      api 'Lapi.svc/Modules_Staff', duration: duration, include_all_info: include_all_info
    end

    def modules_student(duration=0, include_all_info=true)
      api 'Lapi.svc/Modules_Student', duration: duration, include_all_info: include_all_info
    end

    def module(course_id, title_only=false, duration=0, include_all_info=true)
      api 'Lapi.svc/Module', course_id: course_id, title_only: title_only, duration: duration, include_all_info: include_all_info
    end

    def modules_search(search_parameters={}, duration=0, include_all_info=true)
      # Verbatim from API docs: AuthToken, ModuleCode, ModuleTitle, LecturerName, Department, Semester, AcadYear, ModNameExact,
      # LecNameExact, tag are optional fields. But at least one must be supplied.
      api 'Lapi.svc/Modules_Search', search_parameters.merge({ duration: duration, include_all_info: include_all_info })
    end

    def module_lecturers(course_id, duration=0)
      api 'Lapi.svc/Module_Lecturers', course_id: course_id, duration: duration
    end

    def module_information(course_id, duration=0)
      api 'Lapi.svc/Module_Information', course_id: course_id, duration: duration
    end

    def module_weblinks(course_id)
      api 'Lapi.svc/Module_Weblinks', course_id: course_id
    end

    def module_reading_formatted(course_id, duration=0)
      api 'Lapi.svc/Module_ReadingFormatted', course_id: course_id, duration: duration
    end

    def module_reading_unformatted(course_id, duration=0)
      api 'Lapi.svc/Module_ReadingUnformatted', course_id: course_id, duration: duration
    end

    def module_reading(course_id, duration=0)
      api 'Lapi.svc/Module_Reading', course_id: course_id, duration: duration
    end

    def modules_taken(student_id)
      api 'Lapi.svc/Modules_Taken', student_id: student_id
    end
  end
end
