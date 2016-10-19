class Notifier < ActionMailer::Base
  default from: "Mailgun Test Project <postmaster@" + ENV['mg.coffee-and-cream.com'] + ">"

  def send_email(message)
    @message = message
    mail(to: @message[:to], subject: 'Mailgun message via SMTP')
  end
end
