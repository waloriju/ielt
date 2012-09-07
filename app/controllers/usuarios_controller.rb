class UsuariosController < ApplicationController
    respond_to :json, :html
    before_filter :authenticate#, :only => [:new]
    def index
      
    end
    
    def new
      @usuario = Usuario.new
    end
    
    def create
      @usuario = Usuario.new(params[:usuario])
      if @usuario.save
        redirect_to painel_path, notice: "Usuario criado com sucesso!"
      else
        render 'new'
      end
    end
    
    def index
      if !current_user.admin
        flash[:error] = 'Voce nao tem permissao para visualizar todos os usuarios'
        redirect_to painel_url
      else
        @usuarios = Usuario.all
      end
    end
end
