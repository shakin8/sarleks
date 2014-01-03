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

  def discover
  end

  def leaderboard
    @title = "Leaderboards"
    @pieces = Piece.unscoped.order("votes DESC").first(5)
    @voters = []
    @pieces.each do |voters|
      @voters << voters.users
    end
  end

  def whatsnew
    @title = "What's New"
    @pieces = Piece.first(10)
  end
end
