class Room < ApplicationRecord
  mount_uploader :room_image, ImageUploader
  belongs_to :user
  has_many :reservations, dependent: :destroy, foreign_key: 'room_id'
  validates :room_name, presence: true
  validates :memo, presence: true
  validates :price, presence: true,numericality: true
  validates :adress, presence: true
  validates :room_image, presence:true
  
   def self.search(area)
       Room.where(['adress LIKE ?', "%#{area}%"]) 
   end 
   
   def self.search(key)
       Room.where(['room_name LIKE ? OR adress LIKE ? OR price LIKE ?', "%#{key}%", "%#{key}%", "%#{key}%"]) 
   end
   
  
end
