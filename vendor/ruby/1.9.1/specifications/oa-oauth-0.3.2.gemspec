# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{oa-oauth}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Bleigh", "Erik Michaels-Ober"]
  s.date = %q{2011-10-20}
  s.description = %q{OAuth strategies for OmniAuth.}
  s.email = ["michael@intridea.com", "sferik@gmail.com"]
  s.files = ["spec/fixtures/basecamp_200.xml", "spec/fixtures/campfire_200.json", "spec/omniauth/strategies/google_oauth2_spec.rb", "spec/omniauth/strategies/oauth/dopplr_spec.rb", "spec/omniauth/strategies/oauth/douban_spec.rb", "spec/omniauth/strategies/oauth/dropbox_spec.rb", "spec/omniauth/strategies/oauth/evernote_spec.rb", "spec/omniauth/strategies/oauth/flattr_spec.rb", "spec/omniauth/strategies/oauth/flickr_spec.rb", "spec/omniauth/strategies/oauth/goodreads_spec.rb", "spec/omniauth/strategies/oauth/google_health_sandbox_spec.rb", "spec/omniauth/strategies/oauth/google_health_spec.rb", "spec/omniauth/strategies/oauth/google_spec.rb", "spec/omniauth/strategies/oauth/hyves_spec.rb", "spec/omniauth/strategies/oauth/identica_spec.rb", "spec/omniauth/strategies/oauth/linked_in_spec.rb", "spec/omniauth/strategies/oauth/meetup_spec.rb", "spec/omniauth/strategies/oauth/miso_spec.rb", "spec/omniauth/strategies/oauth/my_space_spec.rb", "spec/omniauth/strategies/oauth/netflix_spec.rb", "spec/omniauth/strategies/oauth/oauth_spec.rb", "spec/omniauth/strategies/oauth/orkut_spec.rb", "spec/omniauth/strategies/oauth/plurk_spec.rb", "spec/omniauth/strategies/oauth/rdio_spec.rb", "spec/omniauth/strategies/oauth/smug_mug_spec.rb", "spec/omniauth/strategies/oauth/t163_spec.rb", "spec/omniauth/strategies/oauth/trade_me_spec.rb", "spec/omniauth/strategies/oauth/trip_it_spec.rb", "spec/omniauth/strategies/oauth/tsina_spec.rb", "spec/omniauth/strategies/oauth/tumblr_spec.rb", "spec/omniauth/strategies/oauth/twitter_spec.rb", "spec/omniauth/strategies/oauth/type_pad_spec.rb", "spec/omniauth/strategies/oauth/vimeo_spec.rb", "spec/omniauth/strategies/oauth/xing_spec.rb", "spec/omniauth/strategies/oauth/yahoo_spec.rb", "spec/omniauth/strategies/oauth/you_tube_spec.rb", "spec/omniauth/strategies/oauth2/angellist_spec.rb", "spec/omniauth/strategies/oauth2/bitly_spec.rb", "spec/omniauth/strategies/oauth2/cobot_spec.rb", "spec/omniauth/strategies/oauth2/dailymile_spec.rb", "spec/omniauth/strategies/oauth2/doit_spec.rb", "spec/omniauth/strategies/oauth2/facebook_spec.rb", "spec/omniauth/strategies/oauth2/foursquare_spec.rb", "spec/omniauth/strategies/oauth2/github_spec.rb", "spec/omniauth/strategies/oauth2/glitch_spec.rb", "spec/omniauth/strategies/oauth2/gowalla_spec.rb", "spec/omniauth/strategies/oauth2/instagram_spec.rb", "spec/omniauth/strategies/oauth2/liveid_spec.rb", "spec/omniauth/strategies/oauth2/mailchimp_spec.rb", "spec/omniauth/strategies/oauth2/mailru_spec.rb", "spec/omniauth/strategies/oauth2/salesforce_spec.rb", "spec/omniauth/strategies/oauth2/sound_cloud_spec.rb", "spec/omniauth/strategies/oauth2/taobao_spec.rb", "spec/omniauth/strategies/oauth2/teambox_spec.rb", "spec/omniauth/strategies/oauth2/thirty_seven_signals_spec.rb", "spec/omniauth/strategies/oauth2/viadeo_spec.rb", "spec/omniauth/strategies/oauth2/vkontakte_spec.rb", "spec/omniauth/strategies/oauth2/we_pay_spec.rb", "spec/omniauth/strategies/oauth2/yammer_spec.rb", "spec/spec_helper.rb", "spec/support/shared_examples.rb"]
  s.homepage = %q{http://github.com/intridea/omniauth}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{OAuth strategies for OmniAuth.}
  s.test_files = ["spec/fixtures/basecamp_200.xml", "spec/fixtures/campfire_200.json", "spec/omniauth/strategies/google_oauth2_spec.rb", "spec/omniauth/strategies/oauth/dopplr_spec.rb", "spec/omniauth/strategies/oauth/douban_spec.rb", "spec/omniauth/strategies/oauth/dropbox_spec.rb", "spec/omniauth/strategies/oauth/evernote_spec.rb", "spec/omniauth/strategies/oauth/flattr_spec.rb", "spec/omniauth/strategies/oauth/flickr_spec.rb", "spec/omniauth/strategies/oauth/goodreads_spec.rb", "spec/omniauth/strategies/oauth/google_health_sandbox_spec.rb", "spec/omniauth/strategies/oauth/google_health_spec.rb", "spec/omniauth/strategies/oauth/google_spec.rb", "spec/omniauth/strategies/oauth/hyves_spec.rb", "spec/omniauth/strategies/oauth/identica_spec.rb", "spec/omniauth/strategies/oauth/linked_in_spec.rb", "spec/omniauth/strategies/oauth/meetup_spec.rb", "spec/omniauth/strategies/oauth/miso_spec.rb", "spec/omniauth/strategies/oauth/my_space_spec.rb", "spec/omniauth/strategies/oauth/netflix_spec.rb", "spec/omniauth/strategies/oauth/oauth_spec.rb", "spec/omniauth/strategies/oauth/orkut_spec.rb", "spec/omniauth/strategies/oauth/plurk_spec.rb", "spec/omniauth/strategies/oauth/rdio_spec.rb", "spec/omniauth/strategies/oauth/smug_mug_spec.rb", "spec/omniauth/strategies/oauth/t163_spec.rb", "spec/omniauth/strategies/oauth/trade_me_spec.rb", "spec/omniauth/strategies/oauth/trip_it_spec.rb", "spec/omniauth/strategies/oauth/tsina_spec.rb", "spec/omniauth/strategies/oauth/tumblr_spec.rb", "spec/omniauth/strategies/oauth/twitter_spec.rb", "spec/omniauth/strategies/oauth/type_pad_spec.rb", "spec/omniauth/strategies/oauth/vimeo_spec.rb", "spec/omniauth/strategies/oauth/xing_spec.rb", "spec/omniauth/strategies/oauth/yahoo_spec.rb", "spec/omniauth/strategies/oauth/you_tube_spec.rb", "spec/omniauth/strategies/oauth2/angellist_spec.rb", "spec/omniauth/strategies/oauth2/bitly_spec.rb", "spec/omniauth/strategies/oauth2/cobot_spec.rb", "spec/omniauth/strategies/oauth2/dailymile_spec.rb", "spec/omniauth/strategies/oauth2/doit_spec.rb", "spec/omniauth/strategies/oauth2/facebook_spec.rb", "spec/omniauth/strategies/oauth2/foursquare_spec.rb", "spec/omniauth/strategies/oauth2/github_spec.rb", "spec/omniauth/strategies/oauth2/glitch_spec.rb", "spec/omniauth/strategies/oauth2/gowalla_spec.rb", "spec/omniauth/strategies/oauth2/instagram_spec.rb", "spec/omniauth/strategies/oauth2/liveid_spec.rb", "spec/omniauth/strategies/oauth2/mailchimp_spec.rb", "spec/omniauth/strategies/oauth2/mailru_spec.rb", "spec/omniauth/strategies/oauth2/salesforce_spec.rb", "spec/omniauth/strategies/oauth2/sound_cloud_spec.rb", "spec/omniauth/strategies/oauth2/taobao_spec.rb", "spec/omniauth/strategies/oauth2/teambox_spec.rb", "spec/omniauth/strategies/oauth2/thirty_seven_signals_spec.rb", "spec/omniauth/strategies/oauth2/viadeo_spec.rb", "spec/omniauth/strategies/oauth2/vkontakte_spec.rb", "spec/omniauth/strategies/oauth2/we_pay_spec.rb", "spec/omniauth/strategies/oauth2/yammer_spec.rb", "spec/spec_helper.rb", "spec/support/shared_examples.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, ["~> 0.7.3"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<multi_xml>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<oa-core>, ["= 0.3.2"])
      s.add_runtime_dependency(%q<oauth>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<oauth2>, ["~> 0.5.0"])
      s.add_development_dependency(%q<evernote>, ["~> 1.0"])
      s.add_development_dependency(%q<rack-test>, ["~> 0.5"])
      s.add_development_dependency(%q<rake>, ["~> 0.8"])
      s.add_development_dependency(%q<rdiscount>, ["~> 1.6"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.4"])
      s.add_development_dependency(%q<vcr>, ["~> 1.10"])
      s.add_development_dependency(%q<webmock>, ["~> 1.7"])
      s.add_development_dependency(%q<yard>, ["~> 0.7"])
    else
      s.add_dependency(%q<faraday>, ["~> 0.7.3"])
      s.add_dependency(%q<multi_json>, ["~> 1.0.0"])
      s.add_dependency(%q<multi_xml>, ["~> 0.4.0"])
      s.add_dependency(%q<oa-core>, ["= 0.3.2"])
      s.add_dependency(%q<oauth>, ["~> 0.4.0"])
      s.add_dependency(%q<oauth2>, ["~> 0.5.0"])
      s.add_dependency(%q<evernote>, ["~> 1.0"])
      s.add_dependency(%q<rack-test>, ["~> 0.5"])
      s.add_dependency(%q<rake>, ["~> 0.8"])
      s.add_dependency(%q<rdiscount>, ["~> 1.6"])
      s.add_dependency(%q<rspec>, ["~> 2.5"])
      s.add_dependency(%q<simplecov>, ["~> 0.4"])
      s.add_dependency(%q<vcr>, ["~> 1.10"])
      s.add_dependency(%q<webmock>, ["~> 1.7"])
      s.add_dependency(%q<yard>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<faraday>, ["~> 0.7.3"])
    s.add_dependency(%q<multi_json>, ["~> 1.0.0"])
    s.add_dependency(%q<multi_xml>, ["~> 0.4.0"])
    s.add_dependency(%q<oa-core>, ["= 0.3.2"])
    s.add_dependency(%q<oauth>, ["~> 0.4.0"])
    s.add_dependency(%q<oauth2>, ["~> 0.5.0"])
    s.add_dependency(%q<evernote>, ["~> 1.0"])
    s.add_dependency(%q<rack-test>, ["~> 0.5"])
    s.add_dependency(%q<rake>, ["~> 0.8"])
    s.add_dependency(%q<rdiscount>, ["~> 1.6"])
    s.add_dependency(%q<rspec>, ["~> 2.5"])
    s.add_dependency(%q<simplecov>, ["~> 0.4"])
    s.add_dependency(%q<vcr>, ["~> 1.10"])
    s.add_dependency(%q<webmock>, ["~> 1.7"])
    s.add_dependency(%q<yard>, ["~> 0.7"])
  end
end
