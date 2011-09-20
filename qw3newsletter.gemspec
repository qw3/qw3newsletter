# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "qw3newsletter/version"

Gem::Specification.new do |s|
  s.name        = "qw3newsletter"
  s.version     = Qw3newsletter::VERSION
  s.authors     = ["QW3"]
  s.email       = ["contato@qw3.com.br"]
  s.homepage    = "http://www.qw3.com.br"
  s.summary     = %q{Componente para cadastro de emails}
  s.description = %q{Realiza o cadastro e o gerenciamento de email para newsletter}


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
