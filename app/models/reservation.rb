class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence:true, numericality:true
  
  def total_day
    (self.end_date - self.start_date).to_i
  end

  def total_price
     self.total_day.to_i * self.number_of_people.to_i * self.room.price
  end
  
  
  
end
