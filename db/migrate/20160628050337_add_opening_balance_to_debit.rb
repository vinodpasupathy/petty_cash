class AddOpeningBalanceToDebit < ActiveRecord::Migration
  def change
    add_column :debits, :opening_balance, :integer
  end
end
