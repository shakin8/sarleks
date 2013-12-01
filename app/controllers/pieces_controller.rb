class PiecesController < ApplicationController

  def index
    @user = User.find_by_permalink(params[:user_id])
    @pieces = @user.pieces
  end

  def show
    @title = User.find_by_permalink(params[:id])
    @user = User.find_by_permalink(params[:user_id]) 
    @piece = Piece.find(params[:id])
    @microposts = @user.microposts.first(10)
  end

  def new
    if current_user?(User.find_by_permalink(params[:user_id]))
      @piece = current_user.pieces.build
    else
      flash[:error] = "This action is restricted to the logged in user."
      redirect_to current_user
    end
  end

  def create
    @piece = current_user.pieces.build(params[:piece])
    if @piece.save
      flash[:success] = "Piece created!"
      redirect_to user_piece_path(current_user, @piece)
    else
      render 'new'
    end
  end

  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy
    redirect_to user_pieces_path
    flash[:success] = "Piece Destroyed!"
  end

  def edit
    @piece = Piece.find(params[:id])
    @image = Image.new
  end
end
