Gem::Specification.new do |spec|
  spec.name          = "lita-jira-issues"
  spec.version       = "0.0.1"
  spec.authors       = ["Jeff Paquette"]
  spec.email         = ["jeff@snowmoonsoftware.com"]
  spec.description   = "Watches for issue mentions and responds with helpful details and link"
  spec.summary       = "Watches for issue mentions and responds with helpful details and link"
  spec.homepage      = "https://github.com/snowmoonsoftware/lita-rational-change"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"
  spec.add_runtime_dependency "jira-ruby", ">= 1.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
