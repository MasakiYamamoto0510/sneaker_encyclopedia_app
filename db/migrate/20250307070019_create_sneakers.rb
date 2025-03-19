class CreateSneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :sneakers do |t|

      t.references :admin, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :sneaker_type, foreign_key: true
      t.string :sneaker_name_en
      t.string :sneaker_name_jp
      t.date :year_of_manufactur

      t.timestamps
    end
  end
end
