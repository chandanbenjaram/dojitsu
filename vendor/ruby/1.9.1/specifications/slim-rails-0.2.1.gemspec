# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{slim-rails}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Leonardo Almeida"]
  s.date = %q{2010-11-04}
  s.description = %q{Provide generators for Rails 3}
  s.email = %q{lalmeida08@gmail.com}
  s.files = ["test/fixtures/routes.rb", "test/lib/generators/slim/controller_generator_test.rb", "test/lib/generators/slim/mailer_generator_test.rb", "test/lib/generators/slim/scaffold_generator_test.rb", "test/lib/generators/slim/testing_helper.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/leogalmeida/slim-rails}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Provides generators for Rails 3}
  s.test_files = ["test/fixtures/routes.rb", "test/lib/generators/slim/controller_generator_test.rb", "test/lib/generators/slim/mailer_generator_test.rb", "test/lib/generators/slim/scaffold_generator_test.rb", "test/lib/generators/slim/testing_helper.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<slim>, [">= 0.9.2"])
    else
      s.add_dependency(%q<slim>, [">= 0.9.2"])
    end
  else
    s.add_dependency(%q<slim>, [">= 0.9.2"])
  end
end
