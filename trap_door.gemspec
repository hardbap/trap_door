$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "trap_door/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "trap_door"
  s.version     = TrapDoor::VERSION
  s.authors     = ["Mike Breen", "Philippe Vaucher"]
  s.email       = [""]
  s.homepage    = "https://github.com/hardbap/trap_door"
  s.summary     = "Reverse Captcha for Rails."
  s.description = "Unobtrusive Captcha for your Rails forms. Trap Door works by adding a hidden “honeypot” field to your forms that only a spam bot will fill out. A before filter checks for the presence of this field and banishes bots to a spam trap."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.textile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
