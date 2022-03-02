class User < ApplicationRecord
  validates :name, presence: {message: 'を入力してください'}
  
  has_many :reservations, dependent: :destroy
  has_many :rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  mount_uploader :user_image, ImageUploader
end