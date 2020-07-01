ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'email-smtp.us-east-1.amazonaws.com',
  domain: 'tourapp.ga',
  port: 587,
  user_name: ENV['AWS_ACCESS_KEY_ID'],
  password: ENV['AWS_SECRET_ACCESS_KEY'],
  authentication: 'plain',
  enable_starttls_auto: true
}
