# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nettica}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Conway"]
  s.date = %q{2010-03-29}
  s.default_executable = %q{nettica}
  s.email = %q{matt@conwaysplace.com}
  s.executables = ["nettica"]
  s.files = ["test/test_nettica.rb", "bin/nettica"]
  s.homepage = %q{http://github.com/wr0ngway/nettica}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A ruby client for managing nettica bulk-dns entries using the Nettica SOAP API}
  s.test_files = ["test/test_nettica.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mumboe-soap4r>, [">= 0"])
    else
      s.add_dependency(%q<mumboe-soap4r>, [">= 0"])
    end
  else
    s.add_dependency(%q<mumboe-soap4r>, [">= 0"])
  end
end
