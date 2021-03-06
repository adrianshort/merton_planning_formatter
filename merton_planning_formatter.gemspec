require_relative 'lib/merton_planning_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "merton_planning_formatter"
  spec.version       = MertonPlanningFormatter::VERSION
  spec.authors       = ["Adrian Short"]
  spec.email         = ["adrian@adrianshort.org"]

  spec.summary       = %q{Format Merton Council planning application descriptions/proposals nicely.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/adrianshort/merton_planning_formatter"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.licenses      = ['LGPL-3.0']

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/adrianshort/merton_planning_formatter/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_runtime_dependency "pragmatic_segmenter"
end
