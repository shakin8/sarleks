class ItemisationsController < ApplicationController
  before_filter :signed_in_user

  respond_to :html, :js
  
  def create
  	@user = current_user
    @collection = Collection.find(params[:itemisation][:collection_id])
    @piece = Piece.find(params[:itemisation][:piece_id])
    @collection.itemise!(@piece)

    @pieces = @collection.pieces
    respond_with @pieces
  end 

  def destroy
  	@user = current_user
    @collection = Collection.find(params[:itemisation][:collection_id])
    @piece = Itemisation.find(params[:id]).piece
    @collection.deitemise!(@piece)

    @pieces = @collection.pieces
    respond_with @pieces
  end
end

