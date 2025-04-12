class CreateSneakerComments < ActiveRecord::Migration[6.1]
  def change
    create_table :sneaker_comments do |t|
      t.text :comment, null: false
      t.references :customer, foreign_key: true
      t.references :sneaker, foreign_key: true

      t.timestamps
    end
  end
end
