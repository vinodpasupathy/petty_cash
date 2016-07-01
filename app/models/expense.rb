class Expense < ActiveRecord::Base
validates :total, presence: true,numericality: true
 mount_uploader :voucher, VoucherUploader
end
