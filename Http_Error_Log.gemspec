# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "Http_Error_Log/version"

Gem::Specification.new do |s|
  s.name        = "Http_Error_Log"
  s.version     = Http_Error_Log_VERSION
  s.authors     = ["da99"]
  s.email       = ["i-hate-spam-45671204@mailinator.com"]
  s.homepage    = "https://github.com/da99/Http_Error_Log"
  s.summary     = %q{Parse error.log from servers.}
  s.description = %q{

    Turns your error.log from a server into a Ruby data structure.
    Read me at the homepage.
    
  }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'bacon'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'Bacon_Colored'
  s.add_development_dependency 'pry'
  
  # Specify any dependencies here; for example:
  s.add_runtime_dependency 'Split_Lines'
end
