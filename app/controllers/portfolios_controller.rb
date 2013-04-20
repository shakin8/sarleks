class PortfoliosController < ApplicationController
  def show
  	@title = User.find_by_permalink(params[:id])
  	@portfolio = Portfolio.find(params[:id])
  end

  def edit
  end
end
