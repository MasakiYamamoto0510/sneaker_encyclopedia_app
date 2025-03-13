class RemoveYearOfManufactureFromSneakers < ActiveRecord::Migration[6.1]
  def change
    remove_column :sneakers, :year_of_manufacture, :date
  end
end
