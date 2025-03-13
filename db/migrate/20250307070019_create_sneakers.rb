class CreateSneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :sneakers do |t|

      t.integer :admin_id, optional: true
      t.integer :excavation_id, optional: true
      t.integer :brand_id
      t.string :sneaker_name
      t.string :overview
      t.date :year_of_manufacture
      t.string :color
      t.integer :size_sex
      t.integer :size_country
      t.string :numerical_size



      t.timestamps
    end
  end
end
