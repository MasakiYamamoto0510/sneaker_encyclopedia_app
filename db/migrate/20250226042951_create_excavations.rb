class CreateExcavations < ActiveRecord::Migration[6.1]
  def change
    create_table :excavations do |t|

      t.integer :customer_id, null:false
      t.string :sneaker_name
      t.string :brand_name
      t.text :overview
      t.string :year_of_manufacture
      t.string :color
      t.string :size
      t.text :remarks

      t.timestamps
    end
  end
end
