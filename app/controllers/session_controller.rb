class SessionsController < ApplicationController
  
  def new
    if user_signed_in?
      redirect_to root_path, alert: "What are you trying to do?"
    end
  end
  
  def create
    user = Usuario.where(:email => params[:email]).first

    if user && user.authenticate(params[:password])
      session[:usuario_id] = user.id
      redirect_to dashboard_url, :notice => "Welcome home"
    else
      flash.now.alert = "Invalid email or password"
      notify_bugsnag(RuntimeError.new("Someone tried to login: "+params[:email]))
      render "new"
    end
  end

  def destroy
    session[:usuario] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
