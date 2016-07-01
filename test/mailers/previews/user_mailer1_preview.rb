# Preview all emails at http://localhost:3000/rails/mailers/user_mailer1
class UserMailer1Preview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer1/notify
  def notify
    UserMailer1.notify
  end

end
