class EventosController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html
  
  def index
    @eventos = Evento.all
  end
  
  def new
    @evento = Evento.new
  end
  
  def show
    @evento = Evento.find params[:id]
  end
  
  def create
    @evento = Evento.new(params[:evento])
    
    if @evento.save
      respond_with @evento
    else
      render 'new'
    end 
  end
end
