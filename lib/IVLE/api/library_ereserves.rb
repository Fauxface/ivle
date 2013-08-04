module IVLE
  module LibraryEReserves
    def lib_ereserves(course_id, title_only=false)
      api 'LibEreserves', courseid: course_id, titleonly: title_only
    end

    def lib_ereserve_files(folder_id)
      api 'LibEreserveFiles', folderid: folder_id
    end
  end
end
