require 'omniauth/core'

module OmniAuth
  module Strategies
    autoload :OAuth,              'omniauth/strategies/oauth'
    autoload :Blogger,            'omniauth/strategies/oauth/blogger'
    autoload :Dopplr,             'omniauth/strategies/oauth/dopplr'
    autoload :Douban,             'omniauth/strategies/oauth/douban'
    autoload :Dropbox,            'omniauth/strategies/oauth/dropbox'
    autoload :Evernote,           'omniauth/strategies/oauth/evernote'
    autoload :Flattr,             'omniauth/strategies/oauth/flattr'    
    autoload :Flickr,             'omniauth/strategies/oauth/flickr'    
    autoload :Goodreads,          'omniauth/strategies/oauth/goodreads'
    autoload :Google,             'omniauth/strategies/oauth/google'
    autoload :GoogleHealth,       'omniauth/strategies/oauth/google_health'
    autoload :GoogleHealthSandbox,'omniauth/strategies/oauth/google_health_sandbox'
    autoload :Hyves,              'omniauth/strategies/oauth/hyves'
    autoload :Identica,           'omniauth/strategies/oauth/identica'
    autoload :LinkedIn,           'omniauth/strategies/oauth/linked_in'
    autoload :Meetup,             'omniauth/strategies/oauth/meetup'
    autoload :Miso,               'omniauth/strategies/oauth/miso'
    autoload :MySpace,            'omniauth/strategies/oauth/my_space'
    autoload :Netflix,            'omniauth/strategies/oauth/netflix'
    autoload :Orkut,              'omniauth/strategies/oauth/orkut'    
    autoload :Qzone,              'omniauth/strategies/oauth/qzone'
    autoload :Plurk,              'omniauth/strategies/oauth/plurk'
    autoload :Rdio,               'omniauth/strategies/oauth/rdio'
    autoload :SmugMug,            'omniauth/strategies/oauth/smug_mug'
    autoload :T163,               'omniauth/strategies/oauth/t163'
    autoload :Tqq,                'omniauth/strategies/oauth/tqq'
    autoload :TradeMe,            'omniauth/strategies/oauth/trade_me'
    autoload :TripIt,             'omniauth/strategies/oauth/trip_it'
    autoload :Tsina,              'omniauth/strategies/oauth/tsina'
    autoload :Tsohu,              'omniauth/strategies/oauth/tsohu'
    autoload :Tumblr,             'omniauth/strategies/oauth/tumblr'
    autoload :Twitter,            'omniauth/strategies/oauth/twitter'
    autoload :TypePad,            'omniauth/strategies/oauth/type_pad'
    autoload :Vimeo,              'omniauth/strategies/oauth/vimeo'
    autoload :Yahoo,              'omniauth/strategies/oauth/yahoo'
    autoload :YouTube,            'omniauth/strategies/oauth/you_tube'
    autoload :Xing,               'omniauth/strategies/oauth/xing'

    autoload :OAuth2,             'omniauth/strategies/oauth2'
    autoload :AngelList,          'omniauth/strategies/oauth2/angellist'
    autoload :Bitly,              'omniauth/strategies/oauth2/bitly'
    autoload :Cobot,              'omniauth/strategies/oauth2/cobot'
    autoload :Dailymile,          'omniauth/strategies/oauth2/dailymile'
    autoload :Doit,               'omniauth/strategies/oauth2/doit'
    autoload :Facebook,           'omniauth/strategies/oauth2/facebook'
    autoload :Foursquare,         'omniauth/strategies/oauth2/foursquare'
    autoload :GitHub,             'omniauth/strategies/oauth2/github'
    autoload :Glitch,             'omniauth/strategies/oauth2/glitch'
    autoload :GoogleOAuth2,       'omniauth/strategies/google_oauth2'
    autoload :Gowalla,            'omniauth/strategies/oauth2/gowalla'
    autoload :Instagram,          'omniauth/strategies/oauth2/instagram'
    autoload :Liveid,             'omniauth/strategies/oauth2/liveid'
    autoload :Mailchimp,          'omniauth/strategies/oauth2/mailchimp'
    autoload :Mailru,             'omniauth/strategies/oauth2/mailru'
    autoload :Mixi,               'omniauth/strategies/oauth2/mixi'
    autoload :Renren,             'omniauth/strategies/oauth2/renren'
    autoload :Salesforce,         'omniauth/strategies/oauth2/salesforce'
    autoload :SoundCloud,         'omniauth/strategies/oauth2/sound_cloud'
    autoload :Taobao,             'omniauth/strategies/oauth2/taobao'
    autoload :Teambox,            'omniauth/strategies/oauth2/teambox'
    autoload :ThirtySevenSignals, 'omniauth/strategies/oauth2/thirty_seven_signals'
    autoload :Viadeo,             'omniauth/strategies/oauth2/viadeo'
    autoload :Vkontakte,          'omniauth/strategies/oauth2/vkontakte'
    autoload :WePay,              'omniauth/strategies/oauth2/we_pay'
    autoload :Yammer,             'omniauth/strategies/oauth2/yammer'


    autoload :XAuth,              'omniauth/strategies/xauth'
    autoload :Instapaper,         'omniauth/strategies/xauth/instapaper'
    
  end
end
