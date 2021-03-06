# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "update/version"

Gem::Specification.new do |s|
  s.name        = "update"
  s.version     = Update::VERSION
  s.authors     = ["Shannon Skipper"]
  s.email       = ["shannonskipper@gmail.com"]
  s.homepage    = "https://github.com/havenwood/update"
  s.summary     = %q{a gem to run a list of updates}
  s.description = %q{A Ruby Gem for running a list of update commands from command line.}

  s.rubyforge_project = "update"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "slop", "~> 2.4"
  s.add_development_dependency "awesome_print", "~> 1.0"
  s.add_development_dependency "em-synchrony", "~> 1.0"
  s.add_runtime_dependency "slop", "~> 2.4"
  s.add_runtime_dependency "awesome_print", "~> 1.0"
  s.add_runtime_dependency "em-synchrony", "~> 1.0"
end
