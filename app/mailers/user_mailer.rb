require "sendgrid-ruby"

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml # with the following lookup:
  #
  # en.user_mailer.account_activation.subject
  #
  default from: "notifications@example.com"

  def account_activation(user)
    @user = user
    @url = "http://localhost:3000/login"
    mail to: user.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml # with the following lookup:
  #
  # en.user_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"
    mail to: "to@example.org"
  end
end
