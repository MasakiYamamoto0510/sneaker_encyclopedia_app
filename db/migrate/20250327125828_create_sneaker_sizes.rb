class CreateSneakerSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :sneaker_sizes do |t|

      t.references :sneaker, foreign_key: true
      t.references :size, foreign_key: true

      t.timestamps
    end
  end
end
