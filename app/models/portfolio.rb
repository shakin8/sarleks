class Portfolio < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user

  has_many :categorisations, dependent: :destroy
  has_many :collections, through: :categorisations

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  default_scope order: 'portfolios.created_at ASC'


  def catalogued?(collection)
    categorisations.find_by_collection_id(collection.id)
  end

  def catalogue!(collection)
    categorisations.create!(collection_id: collection.id)
  end

  def decatalogue!(collection)
    categorisations.find_by_collection_id(collection.id).destroy
  end
end
