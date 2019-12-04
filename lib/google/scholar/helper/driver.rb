require 'mechanize'

module Google
  module Scholar
    module Helper
      class Driver
        def initialize(url)
          @url = url
        end

        def goto
          mechanize = Mechanize.new

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
