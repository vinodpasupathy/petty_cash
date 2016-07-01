class AddPayStatusToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :pay_status, :string
  end
end
