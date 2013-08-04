module IVLE
  module StudentEvents
    def student_events(title_only=false)
      api 'StudentEvents', titleonly: title_only
    end

    def student_events_categories(include_events=true, title_only=false)
      api 'StudentEvents_Categories', includeevents: include_events, titleonly: title_only
    end

    def student_events_committees(include_events=true, title_only=false)
      api 'StudentEvents_Committees', includeevents: include_events, titleonly: title_only
    end

    def student_events_category(category_id, title_only=false)
      api 'StudentEvents_Category', categoryid: category_id, titleonly: title_only
    end

    def student_events_committee(committee_id, title_only=false)
      api 'StudentEvents_Committee', committeeid: committee_id, titleonly: title_only
    end

    def student_event_post_new_event(category_id, committee_id, evt_start_date, evt_end_date)
      api_post 'StudentEvent_PostNewEvent_JSON', {
        categoryid: category_id,
        committeeid: committee_id,
        evtstartdate: evt_start_date,
        evtenddate: evt_end_date
      }
    end
  end
end
