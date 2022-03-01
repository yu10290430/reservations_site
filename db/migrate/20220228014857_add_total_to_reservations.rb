class AddTotalToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :total_day, :string
    add_column :reservations, :total_price, :integer
  end
end
