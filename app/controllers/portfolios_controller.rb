class PortfoliosController < ApplicationController

  def index
    @user = User.find_by_permalink(params[:user_id])
    @portfolios = @user.portfolios
  end

  def show
    @title = User.find_by_permalink(params[:id])
    @portfolio = Portfolio.find(params[:id])
  end

  def new
    if current_user?(User.find_by_permalink(params[:user_id]))
      @portfolio = current_user.portfolios.build
    else
      flash[:error] = "This action is restricted to the logged in user."
      redirect_to current_user
    end
  end

  def create
    @portfolio = current_user.portfolios.build(params[:portfolio])
    if @portfolio.save
      flash[:success] = "Portfolio created!"
      redirect_to user_portfolio_path(current_user, @portfolio)
    else
      render 'new'
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to root_path
    flash[:success] = "Portfolio Destroyed!"
  end

  def edit
    @title = "Following"
    @portfolio = Portfolio.find(params[:id])
    @collections = @portfolio.collections.paginate(page: params[:page])
  end
end
