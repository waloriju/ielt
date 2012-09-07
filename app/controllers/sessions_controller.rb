class SessionsController < ApplicationController
  
  def new
    if user_signed_in?
      redirect_to root_path, alert: "Voce ja esta logado"
    end
  end
  
  def create
    user = Usuario.where(:email => params[:email]).first

    if user && user.authenticate(params[:password])
      session[:usuario_id] = user.id
      redirect_to painel_path, :notice => "Bem vindo"
    else
      flash.now.alert = "Email ou senha invalidos"
      render "new"
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_url
  end
end
