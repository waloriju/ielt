# encoding: utf-8
class UsuariosController < ApplicationController
  respond_to :json, :html, :js
  before_filter :authenticate#, :only => [:new]

  def new
    @usuario = Usuario.new
  end

  def show
    @usuario = Usuario.find params[:id]
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      redirect_to usuarios_path, notice: "Usuario criado com sucesso!"
    else
      render 'new'
    end
  end

  def index
    if !user_signed_in?
      return redirect_to root_path
    end
    if !current_user.admin
      flash[:error] = 'Voce nao tem permissao para visualizar todos os usuarios'
      redirect_to painel_url
    else
      @usuarios = Usuario.order_by("created_at desc")
    end
  end

  def destroy
    @usuario = Usuario.find params[:id]

    if @usuario.destroy
      redirect_to usuarios_path, notice: "Usuario removido"
    else
      render 'index', alert: "Houve um erro ao remover o usuario"
    end
  end
  
  def super
    @usuario = Usuario.find params[:id]
    @usuario.admin = true
    @usuario.save
    
    redirect_to usuarios_path, notice: "#{@usuario.nome} agora é administrador"
  end
end
