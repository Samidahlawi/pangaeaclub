class UserMailer < ApplicationMailer
  # default from: "info@pangaeaclub.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_mailer.subject
  #
  def welcome_mailer(user)
    @greeting = "Hi"
    @user = user 
    mail to: user.email , subject: "مرحبا بك في PangaeaClub", from: "info@pangaeaclub.com"
  end
end
