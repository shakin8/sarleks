class UsersController < ApplicationController
  before_filter :signed_in_user, 
                only: [:edit, :update, :destroy, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  before_filter :signed_in_user_filter, only: [:new, :create]

  def show
  	@user = User.find_by_permalink(params[:id])
    @microposts = @user.microposts.first(10)
    @portfolios = @user.portfolios
    @collections = @user.collections
    @pieces = @user.pieces
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 10)
    else
      @micropost = @user.microposts.build
      @feed_items = @user.feed.paginate(page: params[:page], :per_page => 10)      
    end  
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Sarleks!"
      # user_path can be omitted in a redirect
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find_by_permalink(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def edit
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "Following"
    @user = User.find_by_permalink(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find_by_permalink(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def correct_user
    @user = User.find_by_permalink(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def signed_in_user_filter
    if signed_in?
        redirect_to root_path, notice: "Already logged in"
    end
  end
end
