# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{temple}
  s.version = "0.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Magnus Holm", "Daniel Mendler"]
  s.date = %q{2011-09-02 00:00:00.000000000Z}
  s.email = ["judofyr@gmail.com", "mail@daniel-mendler.de"]
  s.files = ["test/filters/test_control_flow.rb", "test/filters/test_dynamic_inliner.rb", "test/filters/test_eraser.rb", "test/filters/test_escapable.rb", "test/filters/test_multi_flattener.rb", "test/filters/test_static_merger.rb", "test/helper.rb", "test/html/test_attribute_merger.rb", "test/html/test_fast.rb", "test/html/test_pretty.rb", "test/mixins/test_dispatcher.rb", "test/mixins/test_grammar_dsl.rb", "test/test_engine.rb", "test/test_erb.rb", "test/test_filter.rb", "test/test_generator.rb", "test/test_grammar.rb", "test/test_hash.rb", "test/test_utils.rb"]
  s.homepage = %q{http://dojo.rubyforge.org/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Template compilation framework in Ruby}
  s.test_files = ["test/filters/test_control_flow.rb", "test/filters/test_dynamic_inliner.rb", "test/filters/test_eraser.rb", "test/filters/test_escapable.rb", "test/filters/test_multi_flattener.rb", "test/filters/test_static_merger.rb", "test/helper.rb", "test/html/test_attribute_merger.rb", "test/html/test_fast.rb", "test/html/test_pretty.rb", "test/mixins/test_dispatcher.rb", "test/mixins/test_grammar_dsl.rb", "test/test_engine.rb", "test/test_erb.rb", "test/test_filter.rb", "test/test_generator.rb", "test/test_grammar.rb", "test/test_hash.rb", "test/test_utils.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<tilt>, [">= 0"])
      s.add_development_dependency(%q<bacon>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<tilt>, [">= 0"])
      s.add_dependency(%q<bacon>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<tilt>, [">= 0"])
    s.add_dependency(%q<bacon>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
