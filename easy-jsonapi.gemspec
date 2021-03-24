# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'easy-jsonapi'
  spec.version       = '0.1.0'
  spec.authors       = ['Joshua DeMoss']
  spec.email         = ['joshua.demoss@curatess.com']

  spec.summary       = 'Middleware to screen non-JSONAPI-compliant requests, a parser to provide OO access to requests, and a validator for validating JSONAPI Serialized responses.'
  spec.description   = 'Write a longer description or delete this line.'
  spec.homepage      = 'https://rubygems.org/gems/easy-jsonapi'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Dev Dependencies
  spec.add_development_dependency 'license_finder', '~> 6.10'
  spec.add_development_dependency 'rack', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'redcarpet', '~> 3.5'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 1.11'
  spec.add_development_dependency 'solargraph', '~> 0.39'

  # Dependencies
  spec.add_dependency 'oj', '~> 3.10'

  spec.license = 'MIT'
end