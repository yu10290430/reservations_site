class Room < ApplicationRecord
  mount_uploader :room_image, ImageUploader
  belongs_to :user
  has_many :reservations, dependent: :destroy, foreign_key: 'room_id'
  validates :room_name, presence: true
  validates :memo, presence: true
  validates :price, presence: true,numericality: true
  validates :adress, presence: true
  validates :room_image, presence:true
  
 
end
