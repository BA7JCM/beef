#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
module BeEF
  module Extension
    module RegisterSEngHandler
      def self.mount_handler(server)
        server.mount('/api/seng', BeEF::Extension::SocialEngineering::SEngRest.new)

        ps_url = BeEF::Core::Configuration.instance.get('beef.extension.social_engineering.powershell.powershell_handler_url')
        server.mount(ps_url.to_s, BeEF::Extension::SocialEngineering::Bind_powershell.new)
      end
    end

    module SocialEngineering
      extend BeEF::API::Extension

      @short_name = 'social_engineering'
      @full_name = 'Social Engineering'
      @description = 'Web page cloner and other social engineering tools.'

      BeEF::API::Registrar.instance.register(BeEF::Extension::RegisterSEngHandler, BeEF::API::Server, 'mount_handler')
    end
  end
end

# Handlers
require 'extensions/social_engineering/web_cloner/web_cloner'
require 'extensions/social_engineering/web_cloner/interceptor'
require 'extensions/social_engineering/powershell/bind_powershell'

# Models
require 'extensions/social_engineering/models/web_cloner'
require 'extensions/social_engineering/models/interceptor'

# RESTful api endpoints
require 'extensions/social_engineering/rest/socialengineering'
