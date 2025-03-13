class RemoveAdminIdFromSneakers < ActiveRecord::Migration[6.1]
  def change
    remove_column :sneakers, :admin_id, :integer
  end
end
