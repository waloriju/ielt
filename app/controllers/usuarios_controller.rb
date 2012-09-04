class UsuariosController < ApplicationController
    respond_to :json, :html
    def index
      
    end
    
    def new
      @usuario = Usuario.new
    end
    
    def create
      @usuario = Usuario.new(params[:usuario])
      if @usuario.save
        redirect_to root_path
      else
        render 'new'
      end
    end
end
