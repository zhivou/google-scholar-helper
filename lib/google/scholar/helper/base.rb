module Google
  module Scholar
    module Helper
      class Base
        attr_reader :page,
                    :publications,
                    :title,
                    :key_words,
                    :total_citations,
                    :h_index

        def initialize(url)
          @page = Google::Scholar::Helper::Driver.new(url).goto
          @publications = get_all_publications
          @title = get_title
          @key_words = get_key_words
          @total_citations = get_total_citations
          @h_index = get_total_h_index
          @i10_index = get_total_i10_index
          self
        end

        def get_all_publications
          all_publications = self.page.search("//tr[@class='gsc_a_tr']")
          organized_publications = []
          all_publications.each_with_index do |p, index|
            container = {
              title: all_publications.search("//tr[@class='gsc_a_tr'][#{index + 1}]//td[1]/a").text,
              co_authors: all_publications.search("//tr[@class='gsc_a_tr'][#{index + 1}]//td[1]/div[1]").text,
              published_by: all_publications.search("//tr[@class='gsc_a_tr'][#{index + 1}]//td[1]/div[2]").text,
              cited_by: all_publications.search("//tr[@class='gsc_a_tr'][#{index + 1}]//td[2]/a").text,
              year: all_publications.search("//tr[@class='gsc_a_tr'][#{index + 1}]//td[3]/span").text
            }
            organized_publications << container
          end
          organized_publications
        end

        def get_title
          self.page.search("//div[@id='gsc_prf_in']").text
        end

        def get_key_words
          self.page.search("//a[@class='gsc_prf_inta gs_ibl']")
        end

        def get_total_citations
          self.page.search("//a[.='Citations']/../following-sibling::td[1]").text
        end

        def get_total_h_index
          self.page.search("//a[.='h-index']/../following-sibling::td[1]").text
        end

        def get_total_i10_index
          self.page.search("//a[.='i10-index']/../following-sibling::td[1]").text
        end
      end
    end
  end
end
