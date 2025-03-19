class AddSneakerTypeNameToSneakerTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :sneaker_types, :sneaker_type_name, :string, null: false
  end
end
