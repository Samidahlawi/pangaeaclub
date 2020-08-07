class ApplicationMailer < ActionMailer::Base
  default from: "info@pangaeaclub.com"
  layout 'mailer'

  def welcome_mailer(user)
    @greeting = "Hi"
    @user = user 
    mail to: user.email , subject: "مرحبا بك في PangaeaClub", from: "info@pangaeaclub.com"
  end
end
