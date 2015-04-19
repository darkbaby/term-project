class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :cname
      t.string :rname
      t.string :day
      t.string :time

      t.timestamps
    end
  end
end
