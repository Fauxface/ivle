module IVLE
  module Consultation
    def consultation_module_facilitators_with_slots(course_id, include_slots, slot_type)
      api 'Lapi.svc/Consultation_ModuleFacilitatorsWithSlots', course_id: course_id, include_slots: include_slots, slot_type: slot_type
    end

    def consultation_slots(lec_id, slot_type)
      api 'Lapi.svc/ConsultationSlots', lec_id: lec_id, slot_type: slot_type
    end

    def consultation_signed_up_slots
      api 'Lapi.svc/Consultation_SignedUpSlots'
    end

    def consultation_sign_up(consultation_id)
      api_post 'Lapi.svc/Consultation_SignUp', consultation_id: consultation_id
    end

    def consultation_sign_up_json(consultation_id)
      # WTF is this? Gosh, just pass in an additional format parameter!
      api_post 'Lapi.svc/Consultation_SignUp_JSON', consultation_id: consultation_id
    end

    def consultation_cancel_slot(consultation_id)
      api_post 'Lapi.svc/Consultation_CancelSlot', consultation_id: consultation_id
    end

    def consultation_cancel_slot_json(consultation_id)
      api_post 'Lapi.svc/Consultation_CancelSlot_JSON', consultation_id: consultation_id
    end
  end
end
