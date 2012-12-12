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

  def edit
    @evento = Evento.find params[:id]
  end

  def update
    @evento = Evento.find params[:id]
    if @evento.update_attributes params[:evento]
      respond_with @evento
    else
      render 'edit'
    end
  end
  
  def destroy
    @evento = Evento.find params[:id]
    
    if @evento.destroy
      redirect_to eventos_path, notice: "Evento removido"
    else
      render 'show'
    end
  end
end
