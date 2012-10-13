# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aether/version'

Gem::Specification.new do |gem|
  gem.add_development_dependency('rake', '>= 0.8')

  gem.add_dependency('ridley', '~> 0.2')

  gem.name          = "aether"
  gem.version       = Aether::VERSION
  gem.authors       = ["Bitium, Inc"]
  gem.email         = ["devops@bitium.com"]
  gem.description   = %q{Simple wrapper over Ridley gem (a Chef API client)}
  gem.summary       = %q{Provides helper methods to be used in Capistrano recipes to retrieve server info from a Chef Server}
  gem.homepage      = "https://github.com/bitium/aether"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
