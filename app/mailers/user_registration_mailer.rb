class UserRegistrationMailer < ActionMailer::Base
  layout "email"

  default from: "from@example.com"

  def registration_email user
    @user = user
    @url = "http://example.com/login"
    mail(to: user.email, :subject => t(".text"))
  end
end
