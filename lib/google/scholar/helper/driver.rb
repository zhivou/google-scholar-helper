require 'mechanize'

module Google
  module Scholar
    module Helper
      class Driver
        def initialize(url)
          @url = url
        end

        def goto
          Mechanize.new.get(@url)
        end
      end
    end
  end
end
