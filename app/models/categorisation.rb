class Categorisation < ActiveRecord::Base
  attr_accessible :collection_id, :portfolio_id

  belongs_to :portfolio
  belongs_to :collection

  validates :portfolio_id, presence: true
  validates :collection_id, presence: true

end
