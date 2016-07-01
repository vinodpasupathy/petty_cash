class AddFromDateToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :from_date, :string
  end
end
