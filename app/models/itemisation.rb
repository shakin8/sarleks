class Itemisation < ActiveRecord::Base
  attr_accessible :collection_id, :piece_id

  belongs_to :collection
  belongs_to :piece

  validates :collection_id, presence: true
  validates :piece_id, presence: true
end
