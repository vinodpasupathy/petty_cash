class UserMailer1 < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer1.notify.subject
  #
  def notify(user)
    @user = "user.email"

    mail to: user.email
  end
end
