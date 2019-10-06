class RankingController < ApplicationController
  def index
    agent = Mechanize.new
    agent.user_agent_alias = "Windows Mozilla"

    page = agent.get("https://eiga.com/ranking")
    arr = []
    srces = agent.page.search('//td[@class="img poster"]').search('img')
    srces.each do |s|
      arr << s.get_attribute('data-src')
      @address = arr.compact.take(5)
      end
    element = page.search(".txt-box h2")
    title = element.inner_text.split(" ")
      titles = title[0..4]
      ary = [titles, @address].transpose
      @ranking = Hash[*ary.flatten]
    # binding.pry
  end
end
