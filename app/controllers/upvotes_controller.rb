class UpvotesController < ApplicationController
  before_filter :signed_in_user

  respond_to :html, :js
  
  def create
  	@user = current_user
    @piece = Piece.find(params[:upvote][:piece_id])
    @user.upvote!(@piece)
  end 

  def destroy
  	@user = current_user
    @piece = Upvote.find(params[:id]).piece
    @user.unupvote!(@piece)
  end
end