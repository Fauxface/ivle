module IVLE
  module MyOrganizer
    def my_organizer_personal(start_date=nil, end_date=nil)
      api 'MyOrganizer_Personal', startdate: start_date, enddate: end_date
    end

    def my_organizer_ivle(start_date=nil, end_date=nil)
      api 'MyOrganizer_IVLE', startdate: start_date, enddate: end_date
    end

    def my_organizer_events(start_date=nil, end_date=nil)
      api 'MyOrganizer_Events', startdate: start_date, enddate: end_date
    end

    def my_organizer_add_personal_event(event_title, venue, event_date_time, description, recur_type, str_days, recur_till_date)
      api_post 'MyOrganizer_AddPersonalEvent_JSON', {
        eventtitle: event_title,
        venue: venue,
        eventdatetime: event_date_time,
        description: description,
        recurtype: recur_type,
        recurtilldate: recur_till_date
      }
    end

    def my_organizer_update_personal_event(event_id, event_title, venue, event_date_time, description, recur_type, weekly_recur_every, str_days, recur_from_date, recur_till_date, update_recurrence_event)
      api_post 'MyOrganizer_UpdatePersonalEvent_JSON', {
        eventid: event_id,
        eventtitle: event_title,
        venue: venue,
        eventdatetime: event_date_time,
        description: description,
        recurtype: recur_type,
        weeklyrecurevery: weekly_recur_every,
        strdays: str_days,
        recurfromdate: recur_from_date,
        recurtilldate: recur_till_date,
        updaterecurrenceevent: update_recurrence_event
      }
    end

    def my_organizer_delete_personal_event(event_id, delete_all_recurrence=true)
      api_post 'MyOrganizer_DeletePersonalEvent_JSON', eventid: event_id, deleteallrecurrence: delete_all_recurrence
    end

    def my_organizer_special_days(start_date=nil, end_date=nil)
      api 'MyOrganizer_SpecialDays', startdate: start_date, enddate: end_date
    end

    def my_organizer_acad_semester_info(acad_year, semester)
      api 'MyOrganizer_AcadSemesterInfo', acadyear: acad_year, semester: semester
    end

    def timetable_student(acad_year, semester)
      api 'Timetable_Student', acadyear: acad_year, semester: semester
    end

    def code_table_week_types
      api 'CodeTable_WeekTypes'
    end
  end
end
