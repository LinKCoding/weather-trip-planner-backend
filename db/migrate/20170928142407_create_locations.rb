class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :coordinates

      t.timestamps
    end
  end
end
