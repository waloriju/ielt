class ContatosController < ApplicationController
  before_filter :authenticate, :except => [:index, :new]
  
  def index
    @contatos = Contato.all
  end
  
  def new
    @contato = Contato.new
  end
  
  def create
    @contato = Contato.new(params[:contato])
    
    if(verify_recaptcha(:model => @contato, :message => "Código incorreto!") && @contato.save)
      redirect_to new_contato_path, notice: "Sua mensagem foi recebida"
    else
      render 'new'
    end
  end
  
  
  def show
    @contato = Contato.find params[:id] 
  end
end
