class HomeController < ApplicationController
  def index

  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end

end
