class Photo < ActiveRecord::Base
  belongs_to :gallery
  attr_accessible :title, :gallery_id, :image

  mount_uploader :image, ImageUploader
  #process_in_background :image
end
