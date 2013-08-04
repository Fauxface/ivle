require 'IVLE/version'
require 'nokogiri'
require 'mechanize'
require 'faraday'
require 'faraday_middleware'

require 'IVLE/api/module'
require 'IVLE/api/login'
require 'IVLE/api/consultation'
require 'IVLE/api/rosters_and_groups'
require 'IVLE/api/announcement'
require 'IVLE/api/forum'
require 'IVLE/api/webcast'
require 'IVLE/api/poll'
require 'IVLE/api/workbin'
require 'IVLE/api/gradebook'
require 'IVLE/api/library_ereserves'
require 'IVLE/api/my_organizer'
require 'IVLE/api/community'
require 'IVLE/api/open_webcast_lectures'
require 'IVLE/api/student_events'
require 'IVLE/api/ivle_news'
require 'IVLE/api/timetable'
require 'IVLE/api/delta_datasets'
require 'IVLE/api/profile'

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
    # Some are plural -- blame the docs
    include IVLE::Login
    include IVLE::IVLEModule
    include IVLE::Consultation
    include IVLE::RostersAndGroups
    include IVLE::Announcement
    include IVLE::Forum
    include IVLE::Webcast
    include IVLE::Poll
    include IVLE::Workbin
    include IVLE::Gradebook
    include IVLE::LibraryEReserves
    include IVLE::MyOrganizer
    include IVLE::Community
    include IVLE::OpenWebcastLectures
    include IVLE::StudentEvents
    include IVLE::IVLENews
    include IVLE::Timetable
    include IVLE::DeltaDatasets
    include IVLE::Profile

    attr_accessor :api_key, :username, :password

    def initialize(api_key, username, password)
      self.api_key  = api_key
      self.username = username
      self.password = password
    end

    # I don't trust the API documentation so this is now public.
    # Call this yourself if my implementation fails.
    def api(method, params={}, verb=:get, add_auth=true)
      params = add_auth(params) if add_auth
      resp = client.send(verb, "api/Lapi.svc/#{method}", params)
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
