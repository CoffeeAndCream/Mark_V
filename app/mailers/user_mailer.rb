class UserMailer < ApplicationMailer
  class AppMailer < ActionMailer::Base

    default from: 'seanjhulse@gmail.com'

    def ContactsController(user)
      @user = user
      mail(to: @user.email_address, subject: "Welcome!")
    end
  end
end
