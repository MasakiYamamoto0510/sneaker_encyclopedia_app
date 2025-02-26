class CreateExcavations < ActiveRecord::Migration[6.1]
  def change
    create_table :excavations do |t|

      t.integer :customer_id, null:false
      t.string :sneaker_name, default: 'not_clear'
      t.string :brand_name, default: 'not_clear'
      t.text :overview, default: 'not_clear'
      t.string :year_of_manufacture, default: 'not_clear'
      t.string :color, default: 'not_clear'
      t.string :size, default: 'not_clear'
      t.text :remarks, default: 'not_clear'

      t.timestamps
    end
  end
end
