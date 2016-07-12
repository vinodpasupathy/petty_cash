class ExpenseCategory < ActiveRecord::Base
	validates :expense_category_list, :uniqueness => true, :presence => true
end
