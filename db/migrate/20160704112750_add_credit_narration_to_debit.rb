class AddCreditNarrationToDebit < ActiveRecord::Migration
  def change
    add_column :debits, :credit_narration, :string
  end
end
