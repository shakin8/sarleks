class Collection < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user

  has_many :categorisations
  has_many :portfolios, through: :categorisations
  has_many :itemisations
  has_many :pieces, through: :itemisations

  validates :user_id, presence: true
  validates :name, presence: true
  default_scope order: 'collections.created_at DESC'
end
