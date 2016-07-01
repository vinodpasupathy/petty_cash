class Debit < ActiveRecord::Base
validates :amount, presence: true,numericality: true

end
