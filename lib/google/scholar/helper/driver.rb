require 'nokogiri'
require 'faraday'

module Google
  module Scholar
    module Helper
      class Driver
        def initialize(url, proxy)
          @url = url
          @proxy = proxy
        end

        def goto
          content = (Faraday.get(@url).body)

          Nokogiri::HTML(content)
        end
      end
    end
  end
end
