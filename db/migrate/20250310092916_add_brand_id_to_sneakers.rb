class AddBrandIdToSneakers < ActiveRecord::Migration[6.1]
  def change
    add_column :sneakers, :sneaker_brand_id, :integer
  end
end
