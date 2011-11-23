# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mumboe-soap4r}
  s.version = "1.5.8.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Diedrick (modifier: swalterd)"]
  s.date = %q{2009-12-07}
  s.email = %q{swalterd@gmail.com}
  s.executables = ["wsdl2ruby.rb", "xsd2ruby.rb"]
  s.files = ["test/runner.rb", "bin/wsdl2ruby.rb", "bin/xsd2ruby.rb"]
  s.homepage = %q{http://dev.ctor.org/soap4r}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{An implementation of SOAP 1.1 for Ruby.}
  s.test_files = ["test/runner.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httpclient>, [">= 2.1.1"])
    else
      s.add_dependency(%q<httpclient>, [">= 2.1.1"])
    end
  else
    s.add_dependency(%q<httpclient>, [">= 2.1.1"])
  end
end
