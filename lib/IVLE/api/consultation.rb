module IVLE
  module Consultation
    def consultation_module_facilitators_with_slots(course_id, include_slots, slot_type)
      api 'Consultation_ModuleFacilitatorsWithSlots', courseid: course_id, includeslots: include_slots, slottype: slot_type
    end

    def consultation_slots(lec_id, slot_type)
      api 'ConsultationSlots', lecid: lec_id, slottype: slot_type
    end

    def consultation_signed_up_slots
      api 'Consultation_SignedUpSlots'
    end

    def consultation_sign_up(consultation_id)
      # WTF is this? Gosh, just pass in an additional format parameter!
      api_post 'Consultation_SignUp_JSON', consultationid: consultation_id
    end

    def consultation_cancel_slot(consultation_id)
      api_post 'Consultation_CancelSlot_JSON', consultationid: consultation_id
    end
  end
end
