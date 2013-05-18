class Image < ActiveRecord::Base
  attr_accessible :image_name, :piece_id, :image, :remote_image_url
  belongs_to :piece

  mount_uploader :image, ImageUploader
end
