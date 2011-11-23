# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{amazon-ec2}
  s.version = "0.9.17"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Glenn Rempe"]
  s.date = %q{2010-11-21}
  s.description = %q{A Ruby library for accessing the Amazon Web Services EC2, ELB, RDS, Cloudwatch, and Autoscaling APIs.}
  s.email = ["glenn@rempe.us"]
  s.executables = ["awshell", "ec2-gem-example.rb", "ec2-gem-profile.rb", "ec2sh", "setup.rb"]
  s.files = ["test/test_Autoscaling_groups.rb", "test/test_EC2.rb", "test/test_EC2_availability_zones.rb", "test/test_EC2_console.rb", "test/test_EC2_elastic_ips.rb", "test/test_EC2_image_attributes.rb", "test/test_EC2_images.rb", "test/test_EC2_instances.rb", "test/test_EC2_keypairs.rb", "test/test_EC2_password.rb", "test/test_EC2_products.rb", "test/test_EC2_responses.rb", "test/test_EC2_s3_xmlsimple.rb", "test/test_EC2_security_groups.rb", "test/test_EC2_snapshots.rb", "test/test_EC2_spot_instance_requests.rb", "test/test_EC2_spot_prices.rb", "test/test_EC2_subnets.rb", "test/test_EC2_volumes.rb", "test/test_ELB_load_balancers.rb", "test/test_RDS.rb", "test/test_helper.rb", "bin/awshell", "bin/ec2-gem-example.rb", "bin/ec2-gem-profile.rb", "bin/ec2sh", "bin/setup.rb"]
  s.homepage = %q{http://github.com/grempe/amazon-ec2}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{amazon-ec2}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Amazon EC2 Ruby gem}
  s.test_files = ["test/test_Autoscaling_groups.rb", "test/test_EC2.rb", "test/test_EC2_availability_zones.rb", "test/test_EC2_console.rb", "test/test_EC2_elastic_ips.rb", "test/test_EC2_image_attributes.rb", "test/test_EC2_images.rb", "test/test_EC2_instances.rb", "test/test_EC2_keypairs.rb", "test/test_EC2_password.rb", "test/test_EC2_products.rb", "test/test_EC2_responses.rb", "test/test_EC2_s3_xmlsimple.rb", "test/test_EC2_security_groups.rb", "test/test_EC2_snapshots.rb", "test/test_EC2_spot_instance_requests.rb", "test/test_EC2_spot_prices.rb", "test/test_EC2_subnets.rb", "test/test_EC2_volumes.rb", "test/test_ELB_load_balancers.rb", "test/test_RDS.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<xml-simple>, [">= 1.0.12"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.9"])
      s.add_development_dependency(%q<test-spec>, [">= 0.10.0"])
      s.add_development_dependency(%q<rcov>, [">= 0.9.9"])
      s.add_development_dependency(%q<perftools.rb>, [">= 0.5.4"])
      s.add_development_dependency(%q<yard>, [">= 0.6.2"])
    else
      s.add_dependency(%q<xml-simple>, [">= 1.0.12"])
      s.add_dependency(%q<mocha>, [">= 0.9.9"])
      s.add_dependency(%q<test-spec>, [">= 0.10.0"])
      s.add_dependency(%q<rcov>, [">= 0.9.9"])
      s.add_dependency(%q<perftools.rb>, [">= 0.5.4"])
      s.add_dependency(%q<yard>, [">= 0.6.2"])
    end
  else
    s.add_dependency(%q<xml-simple>, [">= 1.0.12"])
    s.add_dependency(%q<mocha>, [">= 0.9.9"])
    s.add_dependency(%q<test-spec>, [">= 0.10.0"])
    s.add_dependency(%q<rcov>, [">= 0.9.9"])
    s.add_dependency(%q<perftools.rb>, [">= 0.5.4"])
    s.add_dependency(%q<yard>, [">= 0.6.2"])
  end
end
