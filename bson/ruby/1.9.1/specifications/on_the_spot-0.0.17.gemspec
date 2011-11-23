# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{on_the_spot}
  s.version = "0.0.17"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan Van der Auwera"]
  s.date = %q{2011-11-05}
  s.description = %q{Unobtrusive in place editing, using jEditable; only works in Rails 3}
  s.email = %q{nathan@dixis.com}
  s.homepage = %q{http://github.com/nathanvda/on_the_spot}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{unobtrusive in place editing}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.0.0rc"])
      s.add_development_dependency(%q<actionpack>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<json_pure>, [">= 1.4.6"])
    else
      s.add_dependency(%q<rspec>, [">= 2.0.0rc"])
      s.add_dependency(%q<actionpack>, [">= 3.0.0"])
      s.add_dependency(%q<json_pure>, [">= 1.4.6"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.0.0rc"])
    s.add_dependency(%q<actionpack>, [">= 3.0.0"])
    s.add_dependency(%q<json_pure>, [">= 1.4.6"])
  end
end
