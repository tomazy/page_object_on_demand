# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'page_object_on_demand/version'

Gem::Specification.new do |spec|
  spec.name          = "page_object_on_demand"
  spec.version       = PageObjectOnDemand::VERSION
  spec.authors       = ["tomek"]
  spec.email         = ["tomazy@go2.pl"]

  spec.summary       = %q{I will create page objects for you when you need them}
  spec.description   = %q{I will create page objects for you when you need them}
  spec.homepage      = "https://github.com/tomazy/page_object_on_demand"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "rspec"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
