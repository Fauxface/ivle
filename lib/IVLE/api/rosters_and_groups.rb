module IVLE
  module RostersAndGroups
    def class_roster(course_id)
      api 'Lapi.svc/Class_Roster', course_id: course_id
    end

    def guest_roster(course_id)
      api 'Lapi.svc/Guest_Roster', course_id: course_id
    end

    def groups_by_user_and_module(course_id=nil, acad_year=nil, semester=nil)
      if course_id == nil && (acad_year == nil || semester == nil)
        raise 'Missing arguments: acad_year and semester must not be nil if course_id is nil'
      elsif course_id.nil?
        params = {}
      else
        params = { course_id: course_id, acad_year: acad_year, semester: semester }
      end

      api 'Lapi.svc/GroupsByUserAndModule', params
    end

    def groups_by_user
      api 'Lapi.svc/GroupsByUser'
    end

    def module_class_groups(course_id, flag)
      api 'Lapi.svc/Module_ClassGroups', course_id: course_id, flag: flag
    end

    def module_class_group_users(class_group_id)
      api 'Lapi.svc/Module_ClassGroups', class_group_id: class_group_id
    end

    def module_official_group_users(course_id, module_code, group_name, acad_year, semester, group_type)
      api 'Lapi.svc/Module_OfficialGroupUsers', {
        course_id: course_id,
        module_code: module_code,
        group_name: group_name,
        acad_year: acad_year,
        semester: semester,
        group_type: group_type
      }
    end

    def class_group_sign_up(course_id, group_id)
      api_post 'Lapi.svc/ClassGroupSignUp', course_id: course_id, group_id: group_id
    end

    def class_group_sign_up_json(course_id, group_id)
      api_post 'Lapi.svc/ClassGroupSignUp_JSON', course_id: course_id, group_id: group_id
    end

    def class_group_sign_up_remove(course_id, group_id)
      api_post 'Lapi.svc/ClassGroupSignUpRemove', course_id: course_id, group_id: group_id
    end

    def class_group_sign_up_remove_json(course_id, group_id)
      api_post 'Lapi.svc/ClassGroupSignUpRemove_JSON', course_id: course_id, group_id: group_id
    end

    def group_projects_by_user(course_id, include_groups, group_type)
      api 'Lapi.svc/GroupProjectsByUser', course_id: course_id, include_groups: include_groups, grouptype: group_type
    end

    def project_self_enrol_groups(project_id)
      api 'Lapi.svc/Project_SelfEnrolGroups', project_id: project_id
    end

    def project_group_users(project_group_id)
      api 'Lapi.svc/ProjectGroupUsers', project_group_id: project_group_id
    end

    def project_enrolled_groups
      api 'Lapi.svc/Project_EnrolledGroups'
    end

    def project_group_sign_up(project_group_id)
      api_post 'Lapi.svc/ProjectGroup_SignUp', project_group_id: project_group_id
    end

    def project_group_sign_up_json(project_group_id)
      api_post 'Lapi.svc/ProjectGroup_SignUp_JSON', project_group_id: project_group_id
    end

    def project_group_remove_sign_up(project_group_id)
      api_post 'Lapi.svc/ProjectGroup_RemoveSignUp', project_group_id: project_group_id
    end

    def project_group_remove_sign_up_json(project_group_id)
      api_post 'Lapi.svc/ProjectGroup_RemoveSignUp_JSON', project_group_id: project_group_id
    end
  end
end
