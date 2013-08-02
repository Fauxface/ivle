require 'IVLE/version'
require 'nokogiri'
require 'mechanize'
require 'faraday'
require 'faraday_middleware'

require "IVLE/api/module"
require "IVLE/api/login"
require "IVLE/api/consultation"
require "IVLE/api/rosters_and_groups"
require "IVLE/api/announcement"
require "IVLE/api/forum"
require "IVLE/api/webcast"

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
    include IVLE::Login
    include IVLE::IVLEModule
    include IVLE::Consultation
    include IVLE::RostersAndGroups
    include IVLE::Announcement
    include IVLE::Forum
    include IVLE::Webcast

    attr_accessor :api_key, :username, :password

    def initialize(api_key, username, password)
      self.api_key  = api_key
      self.username = username
      self.password = password
    end

    # I don't trust the API docs so this is now public.
    # Call this yourself if my implementation fails.
    def api(method, params={}, verb=:get)
      resp = client.send(verb, "api/#{method}", add_auth(params))
      format_response(resp.body)
    end

    def api_post(method, params={})
      api(method, params, :post)
    end

    private

    def access_token
      # Seriously IVLE, implement proper oAuth
      # Who did you even enslave to make this

      @access_token ||= begin
        agent = Mechanize.new { |a| a.verify_mode = OpenSSL::SSL::VERIFY_NONE unless IVLE.settings[:verify_ssl] }
        page = agent.get("https://ivle.nus.edu.sg/api/login?apikey=#{api_key}&url=")

        form = page.form_with(name: 'frm') do |f|
          f.field_with(name: 'userid').value = self.username
          f.field_with(name: 'password').value = self.password
        end

        form.submit.body
      end
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

    def add_auth(params)
      default_params = { apikey: api_key, authtoken: access_token }
      default_params.merge(params)
    end

    def format_response(body)
      # Documentation does not represent production (really!?), so we play it safe here
      JSON.parse(body, symbolize_names: true)
    rescue
      Nokogiri::XML(body).root.element_children.each_with_object({}) do |e, h|
        h[e.name.to_sym] = e.content
      end
    end
  end
end
