class RemoveDateFromExpense < ActiveRecord::Migration
  def change
    remove_column :expenses, :date, :string
  end
end
