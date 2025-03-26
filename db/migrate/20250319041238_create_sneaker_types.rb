class CreateSneakerTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :sneaker_types do |t|

      t.references :sneaker_brand, foreign_key: true
      t.string :overview
      t.string :name, null:false

      t.timestamps
    end
  end
end
