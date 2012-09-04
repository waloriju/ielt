class ApplicationController < ActionController::Base
  protect_from_forgery
  #rescue_from CanCan::AccessDenied, :with => :render_auth_exception
  
  def current_user
    @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  def user_signed_in?
    current_user
  end
  
  def authenticate
    redirect_to login_url, alert: "Por favor, faca login para continuar" if current_user.nil?
  end

  def render_auth_exception
     respond_to do |type| 
      type.html { render :template => "errors/401", :status => 401 } 
      type.all  { render :nothing => true, :status => 401 } 
    end
    true
  end
  
  helper_method :current_user, :user_signed_in?, :current_organization
end
