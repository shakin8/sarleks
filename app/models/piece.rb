class Piece < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user

  has_many :images, dependent: :destroy

  has_many :itemisations, dependent: :destroy
  has_many :collections, through: :itemisations

  has_many :upvotes, dependent: :destroy
  has_many :users, through: :upvotes

  validates :user_id, presence: true
  validates :name, presence: true
  default_scope order: 'pieces.created_at DESC'
end
