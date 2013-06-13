class NoticiasController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html
  def index
    #@noticias = Noticia.order_by('created_at desc').all
    @noticias = Noticia.order_by(['created_at', 'desc']).paginate(:per_page => 5, :page => params[:page])

    respond_to do |format|
      format.html
      format.atom
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
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

  def edit
    @noticia = Noticia.find params[:id]
  end

  def update
    @noticia = Noticia.find params[:id]

    if @noticia.update_attributes(params[:noticia])
      redirect_to @noticia, notice: 'Noticia atualizada'
    else
      render 'edit'
    end
  end
  
  def destroy
    @noticia = Noticia.find params[:id]
    if @noticia.delete
      redirect_to noticias_path, notice: "Notícia removida"
    else
      render 'show'
    end
  end
end
