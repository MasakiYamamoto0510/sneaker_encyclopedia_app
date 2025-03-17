class DropExcavations < ActiveRecord::Migration[6.1]
  def change
    drop_table :excavations
  end
end
