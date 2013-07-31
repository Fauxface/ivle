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
  end
end
