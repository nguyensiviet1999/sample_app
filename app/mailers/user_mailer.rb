require "sendgrid-ruby"

class UserMailer < ApplicationMailer
  def account_activation(user, subject = "Activation Mail", content_value = "")
    from = SendGrid::Email.new(email: "emres@framgia.com")
    to = SendGrid::Email.new(email: user.email)

    #TODO setting content full later
    content = SendGrid::Content.new(type: "text/plain", value: content_value)
    mail = SendGrid::Mail.new(from, subject, to, content)

    unless Rails.env.production?
      mail_settings = SendGrid::MailSettings.new
      mail_settings.sandbox_mode = SendGrid::SandBoxMode.new(enable: true)
      mail.mail_settings = mail_settings
    end

    sg = SendGrid::API.new(api_key: "B3lQvyryQFqfk2hh_SSnvw")
    response = sg.client.mail._("send").post(request_body: mail.to_json)
  end
end
