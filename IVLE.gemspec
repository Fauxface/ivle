# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "IVLE/version"

Gem::Specification.new do |s|
  s.name        = "IVLE"
  s.version     = IVLE::VERSION
  s.authors     = ["Ng Guoyou"]
  s.email       = ["fauxface+github@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "IVLE"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"
  s.add_dependency "mechanize"
  s.add_dependency "nokogiri"

  s.add_development_dependency "rspec"
  s.add_development_dependency "debugger"
  s.add_development_dependency "fakeweb"
end
