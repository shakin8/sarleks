class CategorisationsController < ApplicationController
  before_filter :signed_in_user

  respond_to :html, :js
  
  def create
    @portfolio = Portfolio.find(params[:categorisation][:portfolio_id])
    @collection = Collection.find(params[:categorisation][:collection_id])
    @portfolio.catalogue!(@collection)
    respond_with @portfolio
  end 

  def destroy
    @portfolio = Portfolio.find(params[:categorisation][:portfolio_id])
    @collection = Categorisation.find(params[:id]).collection
    @portfolio.decatalogue!(@collection)
    respond_with @portfolio
  end
end

