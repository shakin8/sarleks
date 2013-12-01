# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :username, :permalink
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :portfolios, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :pieces, through: :upvotes
  has_many :pieces, dependent: :destroy

  before_save { self.email.downcase! }
  before_save { self.username.downcase! }
  before_save :create_remember_token
  before_save :create_permalink #permalink to use username instead of ID for users in url.

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :username, presence: true,
                     length: { minimum: 2 },
                     length: { maximum: 20 },
                     uniqueness: { case_sensitive: false }

  def feed
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def upvoted?(piece)
    upvotes.find_by_piece_id(piece.id)
  end

  def upvote!(piece)
    upvotes.create!(piece_id: piece.id)
    increase_votes(piece)
    # calculate the new score of the piece
  end

  def unupvote!(piece)
    upvotes.find_by_piece_id(piece.id).destroy
    decrease_votes(piece)
    # calculate the new score of the piece
  end

  def to_param
    permalink
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def create_permalink
      self.permalink = username.downcase
    end

    def increase_votes(piece)
      # increase the number of overall votes by 1
      p = Piece.find(piece.id)
      p.update_attributes(votes: (p.votes += 1))      
    end

    def decrease_votes(piece)
      # reduce the number of overall votes by 1
      p = Piece.find(piece.id)
      p.update_attributes(votes: (p.votes -= 1))
    end
end

