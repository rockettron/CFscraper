# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'CFscraper/version'

Gem::Specification.new do |spec|
  spec.name          = "CFscraper"
  spec.version       = CFscraper::VERSION
  spec.authors       = ["RDimon2912"]
  spec.email         = ["rdimon2912@gmail.com"]

  spec.summary       = %q{Short summary}
  spec.description   = %q{Codeforces scraper}
  spec.homepage      = "https://github.com/rockettron/CFscraper"

  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
