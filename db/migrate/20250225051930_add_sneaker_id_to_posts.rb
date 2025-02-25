class AddSneakerIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :sneaker_id, :integer
  end
end
