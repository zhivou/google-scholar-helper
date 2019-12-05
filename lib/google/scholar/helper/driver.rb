require 'mechanize'
require 'nokogiri'

module Google
  module Scholar
    module Helper
      class Driver
        def initialize(url)
          @url = url
        end

        def goto
          mechanize = Mechanize.new
          mechanize.user_agent_alias = 'Mac Safari'
          mechanize.request_headers = { "Accept-Encoding" => "" }
          mechanize.ignore_bad_chunking = true
          mechanize.follow_meta_refresh = true

          begin
            page = mechanize.get(@url)
          rescue Mechanize::ResponseCodeError => exception
            if exception.response_code == '403'
              puts "SCHOLAR WARNING: #{exception}"
              page = exception.page
            else
              raise
            end
          end
          page
        end
      end
    end
  end
end
