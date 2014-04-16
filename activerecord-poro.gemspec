# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/poro/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord-poro'
  spec.version       = ActiveRecord::Poro::VERSION
  spec.authors       = ['Eric J. Holmes']
  spec.email         = ['eric@ejholmes.net']
  spec.description   = %q{Associations for plain old ruby objects}
  spec.summary       = %q{Associations for plain old ruby objects}
  spec.homepage      = 'https://github.com/remind101/activerecord-poro'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'virtus'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3'
end
