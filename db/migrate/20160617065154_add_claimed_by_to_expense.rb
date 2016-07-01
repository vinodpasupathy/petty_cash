class AddClaimedByToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :claimed_by, :string
  end
end
