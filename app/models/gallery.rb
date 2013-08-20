class Gallery < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :photos
end
