$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tax_easy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tax_easy"
  s.version     = TaxEasy::VERSION
  s.authors     = ["Victor Alencar"]
  s.email       = ["victor.a.alencar@gmail.com"]
  s.homepage    = "https://github.com/valencar/tax_easy"
  s.summary     = "TaxEasy - Calculate Taxes"
  s.description = "TaxEasy - Calculate Taxes"
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'exonio', '~> 0.5.2'

  s.add_development_dependency 'rspec', '~> 2.99.0'
  s.add_development_dependency 'pry-byebug', '~> 3.1.0'
end
