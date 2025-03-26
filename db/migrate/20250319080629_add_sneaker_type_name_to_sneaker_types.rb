class AddSneakerTypeNameToSneakerTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :sneaker_types, :name, :string, null: false
  end
end
