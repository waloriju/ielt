class PasswordMailer < ActionMailer::Base
  default from: "bot@ieltoledo.org"
  
  def send_new_password(user, password)
    @user = user
    @password = password
    
    mail(:to => @user.email, :subject => "Nova senha").deliver
  end
end
