# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simple-navigation}
  s.version = "3.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andi Schacke", "Mark J. Titorenko"]
  s.date = %q{2011-12-02}
  s.description = %q{With the simple-navigation gem installed you can easily create multilevel navigations for your Rails, Sinatra or Padrino applications. The navigation is defined in a single configuration file. It supports automatic as well as explicit highlighting of the currently active navigation through regular expressions.}
  s.email = %q{andreas.schacke@gmail.com}
  s.homepage = %q{http://github.com/andi/simple-navigation}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{andi}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{simple-navigation is a ruby library for creating navigations (with multiple levels) for your Rails2, Rails3, Sinatra or Padrino application.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.2"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.1"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.2"])
      s.add_dependency(%q<rspec>, [">= 2.0.1"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.2"])
    s.add_dependency(%q<rspec>, [">= 2.0.1"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
  end
end
