class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :building
      t.text :tools
      t.integer :capacity

      t.timestamps
    end
  end
end
