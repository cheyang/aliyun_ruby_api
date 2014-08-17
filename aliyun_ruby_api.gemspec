# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aliyun_ruby_api/version'

Gem::Specification.new do |spec|
  spec.name          = "aliyun_ruby_api"
  spec.version       = AliyunRubyApi::VERSION
  spec.authors       = ["cheyang"]
  spec.email         = ["cheyang@163.com"]
  spec.summary       = %q{Ruby API client for accessing Aliyun ECS}
  spec.description   = %q{Ruby API client for using Aliyun ECS}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.required_ruby_version = '>= 1.9.3'
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency "ruby-hmac"
end
