class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :location
      t.string :prop_type
      t.integer :occupancy
      t.string :details
      t.integer :price
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
