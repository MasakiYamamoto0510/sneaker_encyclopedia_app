class RemoveSneakerIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :sneaker_id, :integer
  end
end
