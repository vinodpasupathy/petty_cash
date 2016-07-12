class User < ActiveRecord::Base
  validates :name,:email,:password,:phone,:role ,presence:true
  validates :name, :length => { :minimum => 2 }
  validates :phone,:uniqueness => true, :format => { :with => /\A(\+1)?[0-9]{10}\z/, :message => "Not a valid 10-digit telephone number" }
  validates :email, :uniqueness => false
  validates :password, :length => { :in => 6..20 }
end
