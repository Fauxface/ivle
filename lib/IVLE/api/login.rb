module IVLE
  module Login
    def validate(api_key, token)
      api 'Lapi.svc/Validate', apikey: api_key, token: token
    end

    def username_get(api_key, token)
      api 'Lapi.svc/UserName_Get', apikey: api_key, token: token
    end

    def userid_get(api_key, token)
      api 'Lapi.svc/UserID_Get', apikey: api_key, token: token
    end

    def useremail_get(api_key, token)
      api 'Lapi.svc/UserEmail_Get', apikey: api_key, token: token
    end
  end
end
