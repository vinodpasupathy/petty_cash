class UserMailer < ApplicationMailer
 
  def welcome_email(user)
    @user = "user.email"
# Admin mail
    mail to: "poombavai1994@gmail.com" 
  end
end
