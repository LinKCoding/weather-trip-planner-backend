class CreateUserTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :user_trips do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
