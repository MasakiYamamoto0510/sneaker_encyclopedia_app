class AddYearOfManufactureToSneakers < ActiveRecord::Migration[6.1]
  def change
    add_column :sneakers, :year_of_manufacture, :date
  end
end
