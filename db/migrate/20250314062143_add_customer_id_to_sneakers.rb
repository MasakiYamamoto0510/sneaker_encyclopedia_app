class AddCustomerIdToSneakers < ActiveRecord::Migration[6.1]
  def change
    add_column :sneakers, :customer_id, :integer
  end
end
