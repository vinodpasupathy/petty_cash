class AddApprovedByToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :approved_by, :string
  end
end
