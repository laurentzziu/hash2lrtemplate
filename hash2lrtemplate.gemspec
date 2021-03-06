# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash2lrtemplate/version'

Gem::Specification.new do |spec|
  spec.name          = 'hash2lrtemplate'
  spec.version       = Hash2lrtemplate::VERSION
  spec.authors       = ['Florinel Gorgan']
  spec.email         = ['florin@floringorgan.com']

  spec.summary       = %q(Convert Hash objects to .lrtemplate strings.)
  spec.description   = %q{Convert Hash objects to strings formatted as .lrtemplate (Adobe Lightroom) files.}
  spec.homepage      = 'https://github.com/laurentzziu/hash2lrtemplate'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'callable_class'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'
end
