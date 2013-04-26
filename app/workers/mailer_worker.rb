class MailerWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(id)
    @user = Usuario.find id
    @password = SecureRandom.hex
    @user.password = @password
    @user.save
    
    PasswordMailer.send_new_password(@user, @password)
  end
end