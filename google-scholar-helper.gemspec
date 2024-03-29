lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "google/scholar/helper/version"

Gem::Specification.new do |spec|
  spec.name          = "google-scholar-helper"
  spec.version       = Google::Scholar::Helper::VERSION
  spec.authors       = ["Dmitrii Skrylev"]
  spec.email         = ["zivou4@gmail.com"]

  spec.summary       = %q{A simple gem to show information for 1 user from google scholar page.}
  spec.homepage      = "https://github.com/zhivou/google-scholar-helper"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "*"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/zhivou/google-scholar-helper"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.10", ">= 1.10.5"
  spec.add_dependency 'mechanize', '~> 2.7', '>= 2.7.6'
  spec.add_dependency 'faraday'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
