class AddExpenseTypeToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :expense_type, :string
  end
end
