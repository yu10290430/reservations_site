class Room < ApplicationRecord
  has_many :reservations
  mount_uploader :room_image, ImageUploader
end
