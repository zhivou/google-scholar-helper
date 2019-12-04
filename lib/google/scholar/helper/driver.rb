require 'mechanize'
require 'openssl'

module Google
  module Scholar
    module Helper
      class Driver
        def initialize(url)
          @url = url
          @cert_store = OpenSSL::X509::Store.new
          @cert_store.add_file('cacert-2019-11-27.pem')
        end

        def goto
          mechanize = Mechanize.new
          mechanize.user_agent_alias = 'Mac Safari'
          mechanize.request_headers
          mechanize.cert_store = @cert_store

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
