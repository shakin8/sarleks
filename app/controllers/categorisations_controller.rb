class CategorisationsController < ApplicationController
  before_filter :signed_in_user

  respond_to :html, :js
  
  def create
  	@user = current_user
    @portfolio = Portfolio.find(params[:categorisation][:portfolio_id])
    @collection = Collection.find(params[:categorisation][:collection_id])
    @portfolio.catalogue!(@collection)

    @collections = @portfolio.collections
    respond_with @collections
  end 

  def destroy
  	@user = current_user
    @portfolio = Portfolio.find(params[:categorisation][:portfolio_id])
    @collection = Categorisation.find(params[:id]).collection
    @portfolio.decatalogue!(@collection)

  	@user = current_user
    @portfolio = Portfolio.find(params[:categorisation][:portfolio_id])
    @collections = @portfolio.collections
    respond_with @collections
  end
end

