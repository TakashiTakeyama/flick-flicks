class RankingController < ApplicationController
  def index
    agent = Mechanize.new
    agent.user_agent_alias = "Windows Mozilla"

    page = agent.get("https://eiga.com/ranking")
    element = page.search(".txt-box h2")
    title = element.inner_text.split(" ")
    @a = title[0..4]
  end
end
