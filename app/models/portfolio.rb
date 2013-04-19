class Portfolio < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  default_scope order: 'portfolios.created_at DESC'
end
