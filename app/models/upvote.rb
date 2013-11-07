class Upvote < ActiveRecord::Base
  attr_accessible :piece_id, :user_id

  belongs_to :user
  belongs_to :piece

  validates :user_id, presence: true
  validates :piece_id, presence: true
end
