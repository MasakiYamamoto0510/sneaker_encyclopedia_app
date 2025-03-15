class CreateExcavations < ActiveRecord::Migration[6.1]
  def change
    create_table :excavations do |t|

      t.integer :customer_id, null:false
      t.string :sneaker_name
      t.string :overview
      t.string :color
      t.integer :size_sex
      t.integer :size_country
      t.string :numerical_size
      t.date :year_of_manufacture
      t.integer :sneaker_brand_id

      t.timestamps
    end
  end
end
