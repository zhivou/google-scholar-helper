require 'nokogiri'
require 'open-uri'
require 'openssl'

module Google
  module Scholar
    module Helper
      class Driver
        def initialize(url)
          @url = url
        end

        def goto
          content = open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'firefox')
          Nokogiri::HTML(content)
        end
      end
    end
  end
end
