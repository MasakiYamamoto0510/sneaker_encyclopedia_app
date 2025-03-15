class AddAdminIdToExcavations < ActiveRecord::Migration[6.1]
  def change
    add_column :excavations, :admin_id, :integer
  end
end
