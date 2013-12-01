class StaticPagesController < ApplicationController
  def home
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
    @pieces = Piece.unscoped.order("votes DESC").paginate(page: params[:page])
  end

  def whatsnew
    @title = "What's New"
    @pieces = Piece.first(10)
  end
end
