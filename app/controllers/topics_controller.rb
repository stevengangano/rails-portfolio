class TopicsController < ApplicationController
  layout 'portfolio'
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    #passed to show page
    @blogs = @topic.blogs.all if logged_in?(:site_admin)
  end

end
