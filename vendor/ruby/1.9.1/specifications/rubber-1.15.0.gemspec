# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rubber}
  s.version = "1.15.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Conway"]
  s.date = %q{2011-09-12}
  s.default_executable = %q{vulcanize}
  s.description = %q{      The rubber plugin enables relatively complex multi-instance deployments of RubyOnRails applications to
      Amazon's Elastic Compute Cloud (EC2).  Like capistrano, rubber is role based, so you can define a set
      of configuration files for a role and then assign that role to as many concrete instances as needed. One
      can also assign multiple roles to a single instance. This lets one start out with a single ec2 instance
      (belonging to all roles), and add new instances into the mix as needed to scale specific facets of your
      deployment, e.g. adding in instances that serve only as an 'app' role to handle increased app server load.
}
  s.email = %q{matt@conwaysplace.com}
  s.executables = ["vulcanize"]
  s.files = ["bin/vulcanize"]
  s.homepage = %q{http://github.com/wr0ngway/rubber}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rubber}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A capistrano plugin for managing multi-instance deployments to the cloud (ec2)}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 2.4.0"])
      s.add_runtime_dependency(%q<amazon-ec2>, [">= 0.9.17"])
      s.add_runtime_dependency(%q<aws-s3>, [">= 0"])
      s.add_runtime_dependency(%q<nettica>, [">= 0"])
    else
      s.add_dependency(%q<capistrano>, [">= 2.4.0"])
      s.add_dependency(%q<amazon-ec2>, [">= 0.9.17"])
      s.add_dependency(%q<aws-s3>, [">= 0"])
      s.add_dependency(%q<nettica>, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 2.4.0"])
    s.add_dependency(%q<amazon-ec2>, [">= 0.9.17"])
    s.add_dependency(%q<aws-s3>, [">= 0"])
    s.add_dependency(%q<nettica>, [">= 0"])
  end
end
