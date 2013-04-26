ActionMailer::Base.smtp_settings = {
  :address              => ENV['EMAIL_ADDRESS'],
  :port                 => ENV['EMAIL_PORT'],
  :domain               => ENV['EMAIL_DOMAIN'],
  :user_name            => ENV['EMAIL_USERNAME'],
  :password             => ENV['EMAIL_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}