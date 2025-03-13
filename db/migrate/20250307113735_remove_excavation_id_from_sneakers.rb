class RemoveExcavationIdFromSneakers < ActiveRecord::Migration[6.1]
  def change
    remove_column :sneakers, :excavation_id, :integer
  end
end
