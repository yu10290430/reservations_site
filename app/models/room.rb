class Room < ApplicationRecord
  
  mount_uploader :room_image, ImageUploader
  has_many :reservations
  belongs_to :users
end
