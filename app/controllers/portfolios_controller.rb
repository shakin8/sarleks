class PortfoliosController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :edit]
  before_filter :correct_user, only: :destroy
  def show
  	@title = User.find_by_permalink(params[:id])
  	@portfolio = Portfolio.find(params[:id])
  end

  def new
  	@portfolio = current_user.portfolios.build
  end

  def create
  	@portfolio = current_user.portfolios.build(params[:portfolio])
    if @portfolio.save
      flash[:success] = "Portfolio created!"
      redirect_to user_portfolio_path(current_user, @portfolio)
    else
      @feed_items = []
      redirect_to current_user
    end
  end
end
