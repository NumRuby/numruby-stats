# frozen_string_literal: true

require_relative 'lib/numruby/stats/version'

Gem::Specification.new do |spec|
  spec.name = 'numruby-stats'
  spec.version = Numruby::Stats::VERSION
  spec.authors = ['Shane Becker']
  spec.email = ['veganstraightedge@gmail.com']

  spec.summary = 'NumRuby: Statistics & probability library'
  spec.description = 'NumRuby module: Statistics & probability library'
  spec.homepage = 'https://github.com/RubyNum/numruby-stats'
  spec.license = 'BSD-3-Clause'
  spec.required_ruby_version = '>= 3.4.7'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/RubyNum/numruby-stats'
  spec.metadata['changelog_uri'] = 'https://github.com/RubyNum/numruby-stats/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/ .github/ .rubocop.yml])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
