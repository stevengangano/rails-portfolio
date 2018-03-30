class PortfolioosController < ApplicationController
  #instead of application.html.erb, it uses portfolio.html.erb
  layout "portfolio"
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @portfolios = Portfolioo.recent.all
    # @portfolio = Portfolioo.paginate(page: params[:page], per_page: 5)
    @page_title = "Portfolio | Home"
  end

  def ruby
    @portfolio = Portfolioo.ruby_on_rails
  end

  def new
    @portfolio = Portfolioo.new
    @page_title = "Portfolio | New"
  end
  #Posts an article from (articles/new)
  def create
    #render plain: params[:article].inspect
    @portfolio = Portfolioo.new(portfolio_params)
    # @article.user = current_user
    if @portfolio.save
        flash[:notice] = "Article was successfully created"
        redirect_to portfolio_path
    else
      render :new
    end
  end

  def edit
    # @portfolio = Portfolioo.find(params[:id])
  end

  #no template
  def update
    # @portfolio = Portfolioo.find(params[:id])
    if @portfolio.update(portfolio_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to portfolio_path
    else
      render :edit
    end
  end

  def show
    # @portfolio = Portfolioo.find(params[:id])
  end

  #no template
  def destroy
    # @portfolio = Portfolioo.find(params[:id])
    @portfolio.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to portfolio_path
  end


  private
  #method to add data to the database
    def portfolio_params
      params.require(:portfolioo).permit(:title,
                                         :subtitle,
                                         :body,
                                         :main_image)

    end

  def set_portfolio_item
    @portfolio = Portfolioo.find(params[:id])
  end



end
