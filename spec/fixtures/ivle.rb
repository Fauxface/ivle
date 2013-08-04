module Fixtures
  module IVLE
    def read_fixture(name)
      File.read(File.dirname(__FILE__) + "/api/#{name}")
    end
  end
end