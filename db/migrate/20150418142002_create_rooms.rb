class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :tools
      t.integer :capacity
      t.string :building

      t.timestamps
    end
  end
end
