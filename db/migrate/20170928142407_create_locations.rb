class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :start_date
      t.string :end_date
      t.string :coordinates

      t.timestamps
    end
  end
end
