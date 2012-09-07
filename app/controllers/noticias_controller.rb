class NoticiasController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html
  def index
    #@noticias = Noticia.order_by('created_at desc').all
    @noticias = Noticia.order_by(['created_at', 'desc']).paginate(:per_page=>5, :page=>params[:page])
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
  
  def show
    @noticia = Noticia.find params[:id]
  end
end
