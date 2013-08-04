# IVLE
#### version 0.0.1 &beta;
Basic Ruby gem wrapper for NUS IVLE LAPI interface. All methods are implemented (but not tested).

* [IVLE LAPI documentation](http://wiki.nus.edu.sg/display/ivlelapi/Home)
* A skeleton gem documentation is available in `doc`.

This gem is in beta and is not guaranteed to work 100%. If you encounter problems, submit an issue (preferably with the bugfix) and I'll get on it.

## Installation

Add this line to your application's Gemfile:

    gem 'ivle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ivle

## Usage

    ivle = IVLE::API.new('api_key', 'access_token')
    => #<IVLE::API:0x41e5a98 @api_key="api_key", @access_token="access_token">

    # Or, pass in the username and password and retrieve the token via Mechanize

    ivle = IVLE::API.new('api_key', 'username', 'password')
    => #<IVLE::API:0x4112d00 @api_key="api_key", @username="username", @password="password">

    ivle.modules
    => {:Results=>[{:Announcements=>[], :Forums=>[], :Workbins=>[], :Webcasts=>[], ... }

    ivle.profile_view
    => {:Results=>[{:UserID=>"My user ID", :Name=>"My Name", ...}

    ivle.module_weblinks '4215f7f9-794d-4045-8d2d-0f8d2db2444f'
    => {"Results":[{"ID":"4215f7f9-794d-4045-8d2d-0f8d2db2444f","URL":"http://byob.berkeley.edu/", ... }

### API Key
Log in to IVLE, then access this URL: [http://ivle.nus.edu.sg/LAPI/default.aspx](http://ivle.nus.edu.sg/LAPI/default.aspx)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### TODO
* Use proper oAuth authentication
* More specs

### Tests
There is a simple RSpec in `spec`.

To run it: `bundle exec rspec spec/api/api_spec.rb`