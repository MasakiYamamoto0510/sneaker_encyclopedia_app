class RemoveBrandIdFromSneakers < ActiveRecord::Migration[6.1]
  def change
    remove_column :sneakers, :brand_id, :integer
  end
end
