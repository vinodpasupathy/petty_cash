class AddAdvanceAmountToUser < ActiveRecord::Migration
  def change
    add_column :users, :advance_amount, :integer
  end
end
