class AddTotalExpensesToDebit < ActiveRecord::Migration
  def change
    add_column :debits, :total_expenses, :integer
  end
end
