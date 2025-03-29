class CreateSneakerBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :sneaker_brands do |t|

      t.string :name, index: true
      t.text :overview, null: false

      t.timestamps
    end
  end
end
