class NoticiasController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html
  def index
    
  end
  
  def create
    @noticia = Noticia.new(params[:noticia])
    @noticia.usuario = current_user
    
    if @noticia.save
      redirect_to @noticia, notice: "Noticia criada com sucesso!"
    else
      render 'new'
    end
  end
  
  def new
    @noticia = Noticia.new
  end
end
