class CollectionsController < ApplicationController

  def index
    @user = User.find_by_permalink(params[:user_id])
    @collections = @user.collections
  end

  def show
    @user = User.find_by_permalink(params[:user_id])
    @collection = Collection.find(params[:id])
    @pieces = @collection.pieces
    @title = "#{@collection.name} by #{@user.username.sub(/^(\w)/) {|s| s.capitalize}}"
  end

  def new
    if current_user?(User.find_by_permalink(params[:user_id]))
      @collection = current_user.collections.build
    else
      flash[:error] = "This action is restricted to the logged in user."
      redirect_to current_user
    end
  end

  def create
    @collection = current_user.collections.build(params[:collection])
    if @collection.save
      flash[:success] = "Collection created!"
      redirect_to user_collection_path(current_user, @collection)
    else
      render 'new'
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to root_path
    flash[:success] = "Collection Destroyed!"
  end

  def edit
    @title = "Edit Collection"
    @collection = Collection.find(params[:id])
    @pieces = @collection.pieces.paginate(page: params[:page])
  end
end
