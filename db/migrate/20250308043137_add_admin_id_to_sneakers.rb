class AddAdminIdToSneakers < ActiveRecord::Migration[6.1]
  def change
    add_reference :sneakers, :admin, foreign_key: true
  end
end
