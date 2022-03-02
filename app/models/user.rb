class User < ApplicationRecord
  mount_uploader :user_image, ImageUploader
  validates :name, presence: {message: 'を入力してください'}
  belongs_to :post
  has_many :reservations, dependent: :destroy, foreign_key: 'user_id'
  has_many :rooms, dependent: :destroy, foreign_key: 'user_id'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end