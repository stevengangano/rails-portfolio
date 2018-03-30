class HomeController < ApplicationController
  layout 'portfolio'
  def index

  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end

end
