class Room < ApplicationRecord
  mount_uploader :room_image, ImageUploader
  belongs_to :user
  has_many :reservations, dependent: :destroy, foreign_key: 'room_id'
  validates :room_name, presence: true, length: {maximum:30}
  validates :memo, presence: true, length: {maximum:100}
  validates :price, presence: true,numericality:{only_integer: true,greater_than_or_equal_to: 100, less_than_or_equal_to: 9999999}
  validates :adress, presence: true
  validates :room_image, presence:true
  
   def self.search(area)
       Room.where(['adress LIKE ?', "%#{area}%"]) 
   end 
   
   def self.search(key)
       Room.where(['room_name LIKE ? OR adress LIKE ? OR price LIKE ?', "%#{key}%", "%#{key}%", "%#{key}%"]) 
   end
   
  
end
