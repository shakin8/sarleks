class Portfolio < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user

  has_many :categorisations
  has_many :collections, through: :categorisations

  validates :user_id, presence: true
  validates :name, presence: true
  default_scope order: 'portfolios.created_at ASC'
end
