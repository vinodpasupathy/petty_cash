class AddClaimStatusToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :claim_status, :string
  end
end
