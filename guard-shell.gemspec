Gem::Specification.new do |s|
  s.name         = "guard-shell"
  s.author       = "Joshua Hawxwell"
  s.email        = "m@hawx.me"
  s.summary      = "Guard gem for running shell commands"
  s.homepage     = "http://github.com/hawx/guard-shell"
  s.license      = 'MIT'
  s.version      = '0.7.2'

  s.description  = <<-DESC
    Guard::Shell automatically runs shell commands when watched files are
    modified.
  DESC

  s.add_dependency 'guard', '>= 2.0.0'
  s.add_dependency 'guard-compat', '~> 1.0'

  s.files        = %w(Readme.md LICENSE)
  s.files       += Dir["{lib}/**/*"]
end
