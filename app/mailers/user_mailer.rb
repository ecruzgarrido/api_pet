class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(to: user.email, subject: t('mailers.users.welcome.subject'))
  end
end
