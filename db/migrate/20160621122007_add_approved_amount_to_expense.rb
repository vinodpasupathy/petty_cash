class AddApprovedAmountToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :approved_amount, :integer
  end
end
