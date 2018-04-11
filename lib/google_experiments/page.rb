module GoogleExperiments
  class Page
    def get_page
      self.about || self.scrape_page
    end

    def tab(i)
      longest_title = @main_list.max do |a, b|
        a.title.length <=> b.title.length
      end.title.length
      tab_length = longest_title - @main_list[i].title.length + 4 - ((i+1).to_s.length)
      ' ' * tab_length
    end


  end
end