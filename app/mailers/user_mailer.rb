class UserMailer < ApplicationMailer
  ActionMailer::Base.smtp_settings = {
  :port           => ENV['smtp.mailgun.org'],
  :address        => ENV['209.61.151.224'],
  :user_name      => ENV['postmaster@mg.coffee-and-cream.com'],
  :password       => ENV['2254dcf122fcabfe9c8c1d8474eea3cb'],
  :domain         => 'coffee-and-cream.heroku.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
end
