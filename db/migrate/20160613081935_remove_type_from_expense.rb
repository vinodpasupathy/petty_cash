class RemoveTypeFromExpense < ActiveRecord::Migration
  def change
    remove_column :expenses, :type, :string
  end
end
