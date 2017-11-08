class PasswordMailer < ApplicationMailer
  default_from: 'noreply@kbc.com'
  def user_login(user,password)
    @password = password
    @eamil = user.email
    mail(to: @email, subject: 'Your login deatils are created to join to our system')
  end
end
