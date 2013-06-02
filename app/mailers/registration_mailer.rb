class RegistrationMailer < ActionMailer::Base
  default from: "no-reply@executter.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.confirm_email.subject
  #
  def confirm_email
    @greeting = "Hi"
    #@link = view_context.confirm_email_url(user.id, user.generic_token, host: Settings.env.host)

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.forgot_password.subject
  #
  def forgot_password(user)
    @link = view_context.password_reset_url(user.id, user.generic_token, host: Settings.env.host)
    mail to: user.email
  end
end
