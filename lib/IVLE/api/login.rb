module IVLE
  module Login
    def validate(api_key, token)
      api 'Validate', apikey: api_key, token: token
    end

    def username_get(api_key, token)
      api 'UserName_Get', apikey: api_key, token: token
    end

    def userid_get(api_key, token)
      api 'UserID_Get', apikey: api_key, token: token
    end

    def useremail_get(api_key, token)
      api 'UserEmail_Get', apikey: api_key, token: token
    end
  end
end
