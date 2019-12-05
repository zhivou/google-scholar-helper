require 'nokogiri'
require 'open-uri'
require 'openssl'

module Google
  module Scholar
    module Helper
      class Driver
        def initialize(url, proxy)
          @url = url
          @proxy = proxy
        end

        def goto
          content = open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'firefox', proxy: proxy) if @proxy
          content = open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'firefox') unless @proxy

          Nokogiri::HTML(content)
        end
      end
    end
  end
end
