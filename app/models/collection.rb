class Collection < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user

  has_many :categorisations, dependent: :destroy
  has_many :portfolios, through: :categorisations
  has_many :itemisations, dependent: :destroy
  has_many :pieces, through: :itemisations

  validates :user_id, presence: true
  validates :name, presence: true
  default_scope order: 'collections.created_at DESC'

  def itemised?(piece)
    itemisations.find_by_piece_id(piece.id)
  end

  def itemise!(piece)
    itemisations.create!(piece_id: piece.id)
  end

  def deitemise!(piece)
    itemisations.find_by_piece_id(piece.id).destroy
  end
end
