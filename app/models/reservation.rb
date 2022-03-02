class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
<<<<<<< HEAD
<<<<<<< HEAD
  validates :number_of_people, presence: true, numericality: true
  validate :start_end_check
  validate :date_before_start

  def start_end_check
    errors.add(:end_date, "は開始日以降の日を登録してください") unless
    start_date == nil || end_date == nil || start_date < end_date 
  end
  
  def date_before_start
   errors.add(:start_date, "は今日以降のものを選択してください")if start_date != nil && end_date != nil && start_date < Date.today
  end
=======
  validates :number_of_people, presence:true, numericality:true
>>>>>>> parent of 7300639 (Merge pull request #6 from yu10290430/develop)
=======
  validates :number_of_people, presence:true, numericality:true
>>>>>>> parent of 7300639 (Merge pull request #6 from yu10290430/develop)
  
  def total_day
    (self.end_date - self.start_date).to_i
  end

  def total_price
     self.total_day.to_i * self.number_of_people.to_i * self.room.price
  end
  
  
  
end
