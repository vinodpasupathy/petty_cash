class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.string :date
      t.string :mode_of_payment
      t.string :cheque_no
      t.string :bank
      t.string :cheque
      t.string :amount

      t.timestamps null: false
    end
  end
end
