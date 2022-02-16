class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :start_date,           null: false, default: ""
      t.date :end_date,             null: false, default: ""
      t.integer :number_of_people,  null: false, default: ""

      t.timestamps
    end
  end
end
