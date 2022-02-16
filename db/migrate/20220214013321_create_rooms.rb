class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_id
      t.string :room_name
      t.string :memo
      t.integer :price
      t.string :adress
      t.string :room_image

      t.timestamps
    end
  end
end
