require 'nokogiri'
require 'open-uri'

module Google
  module Scholar
    module Helper
      class Driver
        def initialize(url)
          @url = url
        end

        def goto
          Nokogiri::HTML(open(@url))
        end
      end
    end
  end
end
