module IVLE
  module Poll
    def polls(course_id, poll_id, title_only=false)
      api 'Polls', courseid: course_id, pollid: poll_id, titleonly: title_only
    end

    def poll_submit_vote(poll_id, poll_question_id, poll_question_option_id, other_text)
      api_post 'Poll_SubmitVote_JSON', pollid: poll_id, pollquestionid: poll_question_id, pollquestionoptionid: poll_question_option_id, othertext: other_text
    end

    def poll_get_voted_user(poll_id, poll_question_id, poll_question_option_id)
      api 'Poll_GetVotedUser', pollid: poll_id, pollquestionid: poll_question_id, pollquestionoptionid: poll_question_option_id
    end

    def poll_get_voted_user_other(poll_id, poll_question_id, poll_question_option_id)
      api 'Poll_GetVotedUser_Other', pollid: poll_id, pollquestionid: poll_question_id, pollquestionoptionid: poll_question_option_id
    end
  end
end
