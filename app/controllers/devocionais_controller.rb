class DevocionaisController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html
  
  def index
    @devocionais = Devocional.all
  end
  
  def new
    @devocional = Devocional.new
  end
  
  def create
    @devocional = Devocional.new params[:devocional]
    @devocional.usuario = current_user
    if @devocional.save
      respond_with @devocional
    else
      render 'new'
    end
  end
  
  def show
    @devocional = Devocional.find params[:id]
  end
  
  def edit
    @devocional = Devocional.find params[:id]
  end
  
  def update
    @devocional = Devocional.find params[:id]
    if @devocional.update_attributes params[:devocional]
      flash[:notice] = "Devocional atualizado"
      respond_with @devocional
    else
      render 'edit'
    end
  end
end
