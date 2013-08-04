module IVLE
  module DeltaDatasets
    def delta_module_timetable(last_modified, module_code=nil)
      api 'Delta_ModuleTimeTable', lastmodified: last_modified, modulecode: module_code
    end
  end
end
