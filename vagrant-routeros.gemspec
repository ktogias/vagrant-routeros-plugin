# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  # TODO: rename name, author, email, description, summary,
  # license, and homepage
  gem.name          = "vagrant-routeros"
  gem.version       = File.read('VERSION').chop
  gem.authors       = ["Konstantinos Togias"]
  gem.email         = ["ktogias@gmail.com"]
  gem.description   = "Vagrant RouterOS guest plugin"
  gem.summary       = "A guest plugin for RouterOS. Mostly configuring and disabling capabilities that cause errors."
  gem.license       = 'MIT'
  gem.homepage      = "https://github.com/ktogias/vagrant-routeros-plugin"

  gem.add_development_dependency "rake", "~> 13.0"
  gem.add_development_dependency "rspec", "~> 3.5.0"

  gem.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|testdrive)/}) }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]
end
