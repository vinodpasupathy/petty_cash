class CreateExpenseCategories < ActiveRecord::Migration
  def change
    create_table :expense_categories do |t|
      t.string :expense_category_list

      t.timestamps null: false
    end
  end
end
