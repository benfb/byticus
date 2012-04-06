# -*- encoding: utf-8 -*-
require File.expand_path('../lib/byticus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ben Bailey"]
  gem.email         = ["bennettbailey@gmail.com"]
  gem.description   = "A text-based RPG made in ruby"
  gem.summary       = "See website for more details"
  gem.homepage      = "http://benbailey.me/byticus"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "byticus"
  gem.require_paths = ["lib"]
  gem.version       = Byticus::VERSION
end
