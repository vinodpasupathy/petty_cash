class AddToDateToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :to_date, :string
  end
end
