# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "update/version"

Gem::Specification.new do |s|
  s.name        = "update"
  s.version     = Update::VERSION
  s.authors     = ["shan"]
  s.email       = ["shannonskipper@gmail.com"]
  s.homepage    = "https://github.com/havenwood/update"
  s.summary     = %q{simple command line updater script in Ruby}
  s.description = %q{update script for updating yer things}

  s.rubyforge_project = "update"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "slop"
  s.add_runtime_dependency "slop"
end
