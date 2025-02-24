class AddSelfIntroductionToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :self_introduction, :text
  end
end
