class RemoveSneakerSizeTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :sneaker_sizes
  end
end
