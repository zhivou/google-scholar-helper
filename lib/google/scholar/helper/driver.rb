require 'mechanize'

module Google
  module Scholar
    module Helper
      class Driver
        def initialize(url)
          @url = url
        end

        def goto
          mechanize = Mechanize.new{|a| a.ssl_version, a.verify_mode = 'SSLv3', OpenSSL::SSL::VERIFY_NONE}
          mechanize.user_agent_alias = 'Mac Safari'
          mechanize.request_headers

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
