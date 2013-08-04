module IVLE
  module Community
    def communities(duration=0)
      api 'Communities', duration: duration
    end

    def community_search(search_type, keyword, active_only=false, title_only=false)
      api 'Community_Search', searchtype: search_type, keyword: keyword, activeonly: active_only, titleonly: title_only
    end

    def community_categories(active_only=false)
      # Just look at this snake_CamelCase consistency!
      api 'CommunityCategories', activeonly: active_only
    end

    def community_tags(active_only=false)
      api 'CommunityTags', activeonly: active_only
    end

    def community(com_id, duration=0)
      api 'Community', comid: com_id, duration: duration
    end

    def community_members(com_id)
      api 'CommunityMembers', comid: com_id
    end

    def community_announcements(com_id, duration=0)
      api 'CommunityAnnouncements', comid: com_id, duration: duration
    end

    def community_workbin_folders(com_id, including_files=true, duration=0)
      api 'CommunityWorkbinFolders', comid: com_id, includingfiles: including_files, duration: duration
    end

    def community_workbin_files(folder_id, duration=0)
      api 'CommunityWorkbinFiles', folderid: folder_id, duration: duration
    end

    def community_forum_headings(com_id, including_posts=true, duration=0)
      api 'CommunityForumHeadings', comid: com_id, includingposts: including_posts, duration: duration
    end

    def community_forum_posts(heading_id, duration=0)
      api 'CommunityForumPosts', headingid: heading_id, duration: duration
    end

    def community_forum_add_log_by_post(post_id)
      api_post 'CommunityForum_AddLogByPost_JSON', postid: post_id
    end

    def community_forum_new_topic(heading_id, title, message)
      api_post 'CommunityForum_NewTopic_JSON', headingid: heading_id, message: message
    end

    def community_forum_reply_post(post_id, title, message)
      api_post 'CommunityForum_ReplyPost_JSON', postid: post_id, title: title, message: message
    end

    def community_weblinks(com_id)
      api 'CommunityWeblinks', comid: com_id
    end

    def community_join(com_id)
      api_post 'Community_Join_JSON', comid: com_id
    end

    def community_quit(com_id)
      api_post 'Community_Quit_JSON', comid: com_id
    end

    def community_add_member(com_id, member_id, member_type)
      api_post 'Community_AddMember_JSON', comid: com_id, memberid: member_id, membertype: member_type
    end

    def community_delete_member(com_id, member_id)
      api_post 'Community_DeleteMember_JSON', comid: com_id, memberid: member_id
    end
    def community_update_member(com_id, member_id, member_type)
      api_post 'Community_UpdateMember_JSON', comid: com_id, memberid: member_id, membertype: member_type
    end

    def community_create(title, description, access_type, default_forum, default_workbin, category_id, tags)
      api_post 'Community_Create_JSON', {
        title: title,
        accesstype: access_type,
        defaultforum: default_forum,
        defaultworkbin: default_workbin,
        categoryid: category_id,
        tags: tags
      }
    end

    def community_update(com_id, title, description, access_type, default_forum, default_workbin, category_id, tags, display_members_to, opening_date, expiry_date)
      api_post 'Community_Update_JSON', {
        comid: com_id,
        title: title,
        description: description,
        accesstype: access_type,
        defaultforum: default_forum,
        defaultworkbin: default_workbin,
        categoryid: category_id,
        tags: tags,
        displaymembersto: display_members_to,
        openingdate: opening_date,
        expirydate: expiry_date
      }
    end

    def download_file(id)
      api 'downloadfile', id: id
    end

    def community_get_task(task_id)
      api 'Community_GetTask', taskid: task_id
    end

    def community_get_all_tasks(com_id)
      api 'Community_GetAllTasks', comid: com_id
    end

    def community_get_sub_task(task_id)
      api 'Community_GetSubTask', taskid: task_id
    end

    def community_create_task(com_id, task_name, task_description, parent_task_id, task_status, task_priority, task_due_date)
      api_post 'Community_CreateTask_JSON', {
        comid: com_id,
        taskname: task_name,
        taskdescription: task_description,
        parenttaskid: parent_task_id,
        taskstatus: task_status,
        taskpriority: task_priority,
        taskduedate: task_due_date
      }
    end

    def community_update_task(task_id, task_name, task_description, parent_task_id, task_status, task_priority, task_due_date)
      api_post 'Community_UpdateTask_JSON', {
        taskid: com_id,
        taskname: task_name,
        taskdescription: task_description,
        parenttaskid: parent_task_id,
        taskstatus: task_status,
        taskpriority: task_priority,
        taskduedate: task_due_date
      }
    end

    def community_delete_task(task_id)
      api_post 'Community_DeleteTask_JSON', taskid: task_id
    end

    def community_create_comment(task_id, comment)
      api_post 'Community_CreateComment_JSON', taskid: task_id, comment: comment
    end

    def community_update_comment(comment_id, comment)
      api_post 'Commmunity_UpdateComment_JSON', commentid: comment_id, comment: comment
    end

    def community_delete_comment(comment_id)
      api_post 'Community_DeleteComment_JSON', commentid: comment_id
    end

    def community_get_comment(comment_id)
      api 'Community_GetComment', commentid: comment_id
    end

    def community_get_all_comments(task_id)
      api 'Community_GetAllComments', taskid: task_id
    end
  end
end
