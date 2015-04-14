# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roger_better_markdown/version'

Gem::Specification.new do |spec|
  spec.name          = "roger_better_markdown"
  spec.version       = RogerBetterMarkdown::VERSION
  spec.authors       = ["Edwin van der Graaf"]
  spec.email         = ["edwin@digitpaint.nl"]
  spec.summary       = "Render markdown with code highlighting in roger."
  spec.homepage      = "https://github.com/digitpaint/roger_better_markdown"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "redcarpet"
  spec.add_dependency "pygments.rb", "~> 0.6.3"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
