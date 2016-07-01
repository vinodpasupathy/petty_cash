class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :type
      t.string :narrate_expense
      t.string :voucher
      t.string :total

      t.timestamps null: false
    end
  end
end
