require "IVLE/version"
require "mechanize"
require "faraday"
require "faraday_middleware"
require "debugger"

require "IVLE/api/IVLEModule"

module IVLE
  class << self
    def root
      File.expand_path '../..', __FILE__
    end

    def settings
      @@settings ||= YAML::load(File.open(File.join(self.root, 'config', 'settings.yml')))
    end
  end

  class API
    include IVLE::IVLEModule

    attr_accessor :api_key, :username, :password

    def initialize(api_key, username, password)
      self.api_key  = api_key
      self.username = username
      self.password = password
    end

    private

    def api(method, params={}, verb=:get)
      @access_token ||= get_token
      params = { apikey: self.api_key, authtoken: @access_token }.merge(params)
      resp = client.send(verb, "api/#{method}", params)
      JSON.parse(resp.body, symbolize_names: true)
    end

    def get_token
      # Seriously IVLE, implement proper oAuth
      # Who did you even enslave to make this

      agent = Mechanize.new { |a| a.verify_mode = OpenSSL::SSL::VERIFY_NONE unless IVLE.settings[:verify_ssl] }
      page = agent.get("https://ivle.nus.edu.sg/api/login?apikey=#{api_key}&url=")

      form = page.form_with(name: 'frm') do |f|
        f.field_with(name: 'userid').value = self.username
        f.field_with(name: 'password').value = self.password
      end

      form.submit.body
    end

    def client
      options = {
        url: 'https://ivle.nus.edu.sg/',
        ssl: { verify: IVLE.settings[:verify_ssl] }
      }

      @client ||= Faraday.new(options) do |faraday|
        faraday.request  :json                                  # convert POST params to JSON
        faraday.response :logger if IVLE.settings[:faraday_log] # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter                # make requests with Net::HTTP
      end
    end
  end
end
