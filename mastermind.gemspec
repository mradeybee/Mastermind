# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mastermind/version'

Gem::Specification.new do |spec|
  spec.name          = "mastermind_adeybee"
  spec.version       = Mastermind::VERSION
  spec.authors       = ["Adepoju Adebayo"]
  spec.email         = ["mradeybee@gmail.com"]

  spec.summary       = %q{Mastermind is a game where you will guess the the colours the computer has in mind.}
  spec.description   = %q{Mastermind is a game where you will guess the the colours the computer has in mind. You will be told if you guess correctly or not. You will have too guess in the same order as the computer to win. Enjoy! :)}
  spec.homepage      = "http://www.mradeybee.com/mastermind"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['mastermind']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler" 
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "colorize"
end
