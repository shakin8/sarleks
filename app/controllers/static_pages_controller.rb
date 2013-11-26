class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
    @title = "Help"
  end

  def about
  end

  def contact
  end

  def leaderboard
    @title = "Leaderboards"
    @pieces = Piece.first(10)
  end

  def whatsnew
    @title = "What's New"
    @pieces = Piece.first(10)
  end
end
