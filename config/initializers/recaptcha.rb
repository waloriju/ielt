Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPTCHA_PUB']
  config.private_key = ENV['RECAPTCHA_PRIV']
end