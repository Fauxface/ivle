module IVLE
  module RostersAndGroups
    def class_roster(course_id)
      api 'Class_Roster', courseid: course_id
    end

    def guest_roster(course_id)
      api 'Guest_Roster', courseid: course_id
    end

    def groups_by_user_and_module(course_id=nil, acad_year=nil, semester=nil)
      if course_id == nil && (acad_year == nil || semester == nil)
        raise 'Missing arguments: acad_year and semester must not be nil if course_id is nil'
      elsif course_id.nil?
        params = {}
      else
        params = { courseid: course_id, acadyear: acad_year, semester: semester }
      end

      api 'GroupsByUserAndModule', params
    end

    def groups_by_user
      api 'GroupsByUser'
    end

    def module_class_groups(course_id, flag)
      api 'Module_ClassGroups', courseid: course_id, flag: flag
    end

    def module_class_group_users(class_group_id)
      api 'Module_ClassGroups', classgroupid: class_group_id
    end

    def module_official_group_users(course_id, module_code, group_name, acad_year, semester, group_type)
      api 'Module_OfficialGroupUsers', {
        courseid: course_id,
        modulecode: module_code,
        groupname: group_name,
        acadyear: acad_year,
        semester: semester,
        grouptype: group_type
      }
    end

    def class_group_sign_up(course_id, group_id)
      api_post 'ClassGroupSignUp_JSON', courseid: course_id, groupid: group_id
    end

    def class_group_sign_up_remove(course_id, group_id)
      api_post 'ClassGroupSignUpRemove_JSON', courseid: course_id, groupid: group_id
    end

    def group_projects_by_user(course_id, include_groups, group_type)
      api 'GroupProjectsByUser', courseid: course_id, includegroups: include_groups, grouptype: group_type
    end

    def project_self_enrol_groups(project_id)
      api 'Project_SelfEnrolGroups', projectid: project_id
    end

    def project_group_users(project_group_id)
      api 'ProjectGroupUsers', projectgroupid: project_group_id
    end

    def project_enrolled_groups
      api 'Project_EnrolledGroups'
    end

    def project_group_sign_up(project_group_id)
      api_post 'ProjectGroup_SignUp_JSON', projectgroupid: project_group_id
    end

    def project_group_remove_sign_up(project_group_id)
      api_post 'ProjectGroup_RemoveSignUp_JSON', projectgroupid: project_group_id
    end
  end
end
