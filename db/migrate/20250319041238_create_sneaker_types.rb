class CreateSneakerTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :sneaker_types do |t|

      t.references :sneaker_brands, foreign_key: true
      t.string :overview

      t.timestamps
    end
  end
end
