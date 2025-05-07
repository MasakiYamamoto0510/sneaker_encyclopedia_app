class RemoveIsPublishFromSneakers < ActiveRecord::Migration[6.1]
  def change
    remove_column :sneakers, :is_publish, :boolean, default: false, null: false
  end
end
