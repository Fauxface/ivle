require 'fakeweb'
require 'IVLE'
require 'fixtures/ivle'

describe IVLE::API do
  include Fixtures::IVLE

  context 'API calls' do
    before do
      FakeWeb.register_uri(:get,
        "https://ivle.nus.edu.sg/api/login?apikey=api_key&url=",
        body: read_fixture('login.html'),
        content_type: "text/html")

      FakeWeb.register_uri(:post,
        "https://ivle.nus.edu.sg/api/login?apikey",
        body: "1111",
        content_type: "text/html")

      stubs = Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get('api/Lapi.svc/Modules') {[ 200, {}, read_fixture('modules.json') ]}
      end

      mock_client = Faraday.new(url: 'https://ivle.nus.edu.sg/') { |f| f.adapter :test, stubs }
      IVLE::API.any_instance.stub(:client).and_return(mock_client)
      @ivle = IVLE::API.new('api_key', 'login', 'pass')
    end

    it 'calls an API method' do
      # This tests the entire API flow.
      expect(@ivle.modules[:Results]).to have(4).items
    end
  end
end