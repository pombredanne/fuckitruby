Gem::Specification.new do |s|
  s.name = "fuckitruby"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alexander Ivanov"]
  s.date = "2015-11-04"
  s.description = "a gem that can automatically fix your NameErrors"
  s.email = "alehander42@gmail.com"
  s.executables = []
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "LICENSE",
    "README.md",
    "Rakefile",
    "lib/fuckitruby.rb",
    "lib/fuckitruby/name_error.rb",
    "lib/fuckitruby/fuck_processor.rb",
    "fuckitruby.gemspec"
  ]
  s.homepage = "http://github.com/alehander42/fuckitruby"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "a gem that can automatically fix your NameErrors"

  s.add_development_dependency 'rspec', '~> 0'
  s.add_runtime_dependency 'parser', '~> 2.2.3'
  s.add_runtime_dependency 'binding_of_caller', '~> 0.7.2'
  s.add_runtime_dependency 'hotwater', '~> 0.1.2'
  s.add_runtime_dependency 'colorize', '~> 0.7.7'
end
