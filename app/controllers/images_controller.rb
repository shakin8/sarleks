class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(params[:image])
    @user = current_user
    @piece = params[:image][:piece_id]

    if @image.save
      flash[:success] = "Image Successfully Uploaded!"
      redirect_to user_piece_path(@user, @piece)
    else
      flash[:error] = "Image Failed To Upload"
      redirect_to user_piece_path(@user, @piece)
    end
  end

  def update
    @image = Image.find(params[:id])
    @user = current_user
    @piece = params[:image][:piece_id]

    if @image.update_attributes(params[:image])
      flash[:success] = "Image was successfully updated."
      redirect_to user_piece_path(@user, @piece) 
    else
      flash[:error] = "Image updated failed."
      redirect_to user_piece_path(@user, @piece)
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @user = current_user
    @piece = params[:image][:piece_id]

    @image.destroy
    
    flash[:success] = "Image was successfully Removed."
    redirect_to user_piece_path(@user, @piece) 
  end
end
