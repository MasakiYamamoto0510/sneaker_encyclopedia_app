class CreateSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :sizes do |t|

      t.string :size_value, null: false

      t.timestamps
    end
  end
end
