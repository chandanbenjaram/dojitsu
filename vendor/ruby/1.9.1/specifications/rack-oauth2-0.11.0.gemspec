# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rack-oauth2}
  s.version = "0.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["nov matake"]
  s.date = %q{2011-09-16}
  s.description = %q{OAuth 2.0 Server & Client Library. Both Bearer and MAC token type are supported.}
  s.email = %q{nov@matake.jp}
  s.files = ["spec/helpers/time.rb", "spec/helpers/webmock_helper.rb", "spec/mock_response/errors/invalid_request.json", "spec/mock_response/resources/fake.txt", "spec/mock_response/tokens/_Bearer.json", "spec/mock_response/tokens/bearer.json", "spec/mock_response/tokens/legacy.json", "spec/mock_response/tokens/legacy.txt", "spec/mock_response/tokens/legacy_without_expires_in.txt", "spec/mock_response/tokens/mac.json", "spec/mock_response/tokens/unknown.json", "spec/rack/oauth2/access_token/authenticator_spec.rb", "spec/rack/oauth2/access_token/bearer_spec.rb", "spec/rack/oauth2/access_token/legacy_spec.rb", "spec/rack/oauth2/access_token/mac/body_hash_spec.rb", "spec/rack/oauth2/access_token/mac/signature_spec.rb", "spec/rack/oauth2/access_token/mac/verifier_spec.rb", "spec/rack/oauth2/access_token/mac_spec.rb", "spec/rack/oauth2/access_token_spec.rb", "spec/rack/oauth2/client/error_spec.rb", "spec/rack/oauth2/client/grant/authorization_code_spec.rb", "spec/rack/oauth2/client/grant/client_credentials_spec.rb", "spec/rack/oauth2/client/grant/password_spec.rb", "spec/rack/oauth2/client/grant/refresh_token_spec.rb", "spec/rack/oauth2/client_spec.rb", "spec/rack/oauth2/debugger/request_filter_spec.rb", "spec/rack/oauth2/oauth2_spec.rb", "spec/rack/oauth2/server/abstract/error_spec.rb", "spec/rack/oauth2/server/authorize/code_spec.rb", "spec/rack/oauth2/server/authorize/error_spec.rb", "spec/rack/oauth2/server/authorize/extensions/code_and_token_spec.rb", "spec/rack/oauth2/server/authorize/token_spec.rb", "spec/rack/oauth2/server/authorize_spec.rb", "spec/rack/oauth2/server/resource/bearer/error_spec.rb", "spec/rack/oauth2/server/resource/bearer_spec.rb", "spec/rack/oauth2/server/resource/error_spec.rb", "spec/rack/oauth2/server/resource/mac/error_spec.rb", "spec/rack/oauth2/server/resource/mac_spec.rb", "spec/rack/oauth2/server/resource_spec.rb", "spec/rack/oauth2/server/token/authorization_code_spec.rb", "spec/rack/oauth2/server/token/client_credentials_spec.rb", "spec/rack/oauth2/server/token/error_spec.rb", "spec/rack/oauth2/server/token/password_spec.rb", "spec/rack/oauth2/server/token/refresh_token_spec.rb", "spec/rack/oauth2/server/token_spec.rb", "spec/rack/oauth2/util_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/nov/rack-oauth2}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{OAuth 2.0 Server & Client Library - Both Bearer and MAC token type are supported}
  s.test_files = ["spec/helpers/time.rb", "spec/helpers/webmock_helper.rb", "spec/mock_response/errors/invalid_request.json", "spec/mock_response/resources/fake.txt", "spec/mock_response/tokens/_Bearer.json", "spec/mock_response/tokens/bearer.json", "spec/mock_response/tokens/legacy.json", "spec/mock_response/tokens/legacy.txt", "spec/mock_response/tokens/legacy_without_expires_in.txt", "spec/mock_response/tokens/mac.json", "spec/mock_response/tokens/unknown.json", "spec/rack/oauth2/access_token/authenticator_spec.rb", "spec/rack/oauth2/access_token/bearer_spec.rb", "spec/rack/oauth2/access_token/legacy_spec.rb", "spec/rack/oauth2/access_token/mac/body_hash_spec.rb", "spec/rack/oauth2/access_token/mac/signature_spec.rb", "spec/rack/oauth2/access_token/mac/verifier_spec.rb", "spec/rack/oauth2/access_token/mac_spec.rb", "spec/rack/oauth2/access_token_spec.rb", "spec/rack/oauth2/client/error_spec.rb", "spec/rack/oauth2/client/grant/authorization_code_spec.rb", "spec/rack/oauth2/client/grant/client_credentials_spec.rb", "spec/rack/oauth2/client/grant/password_spec.rb", "spec/rack/oauth2/client/grant/refresh_token_spec.rb", "spec/rack/oauth2/client_spec.rb", "spec/rack/oauth2/debugger/request_filter_spec.rb", "spec/rack/oauth2/oauth2_spec.rb", "spec/rack/oauth2/server/abstract/error_spec.rb", "spec/rack/oauth2/server/authorize/code_spec.rb", "spec/rack/oauth2/server/authorize/error_spec.rb", "spec/rack/oauth2/server/authorize/extensions/code_and_token_spec.rb", "spec/rack/oauth2/server/authorize/token_spec.rb", "spec/rack/oauth2/server/authorize_spec.rb", "spec/rack/oauth2/server/resource/bearer/error_spec.rb", "spec/rack/oauth2/server/resource/bearer_spec.rb", "spec/rack/oauth2/server/resource/error_spec.rb", "spec/rack/oauth2/server/resource/mac/error_spec.rb", "spec/rack/oauth2/server/resource/mac_spec.rb", "spec/rack/oauth2/server/resource_spec.rb", "spec/rack/oauth2/server/token/authorization_code_spec.rb", "spec/rack/oauth2/server/token/client_credentials_spec.rb", "spec/rack/oauth2/server/token/error_spec.rb", "spec/rack/oauth2/server/token/password_spec.rb", "spec/rack/oauth2/server/token/refresh_token_spec.rb", "spec/rack/oauth2/server/token_spec.rb", "spec/rack/oauth2/util_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 1.1"])
      s.add_runtime_dependency(%q<json>, [">= 1.4.3"])
      s.add_runtime_dependency(%q<httpclient>, [">= 2.2.0.2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3"])
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_runtime_dependency(%q<attr_required>, [">= 0.0.3"])
      s.add_development_dependency(%q<rake>, [">= 0.8"])
      s.add_development_dependency(%q<rcov>, [">= 0.9"])
      s.add_development_dependency(%q<rspec>, [">= 2"])
      s.add_development_dependency(%q<webmock>, [">= 1.6.2"])
    else
      s.add_dependency(%q<rack>, [">= 1.1"])
      s.add_dependency(%q<json>, [">= 1.4.3"])
      s.add_dependency(%q<httpclient>, [">= 2.2.0.2"])
      s.add_dependency(%q<activesupport>, [">= 2.3"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<attr_required>, [">= 0.0.3"])
      s.add_dependency(%q<rake>, [">= 0.8"])
      s.add_dependency(%q<rcov>, [">= 0.9"])
      s.add_dependency(%q<rspec>, [">= 2"])
      s.add_dependency(%q<webmock>, [">= 1.6.2"])
    end
  else
    s.add_dependency(%q<rack>, [">= 1.1"])
    s.add_dependency(%q<json>, [">= 1.4.3"])
    s.add_dependency(%q<httpclient>, [">= 2.2.0.2"])
    s.add_dependency(%q<activesupport>, [">= 2.3"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<attr_required>, [">= 0.0.3"])
    s.add_dependency(%q<rake>, [">= 0.8"])
    s.add_dependency(%q<rcov>, [">= 0.9"])
    s.add_dependency(%q<rspec>, [">= 2"])
    s.add_dependency(%q<webmock>, [">= 1.6.2"])
  end
end