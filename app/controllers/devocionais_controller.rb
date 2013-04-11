class DevocionaisController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html
  
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
end
