class RemoveSelfIntroductionFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :self_introduction, :text
  end
end
