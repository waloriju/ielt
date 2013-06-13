class ContatosController < ApplicationController
  
  def index
    @contatos = Contato.all
  end
  
  def new
    @contato = Contato.new
  end
  
  def create
    @contato = Contato.new(params[:contato])
    
    if @contato.save && verify_recaptcha(:model => @contato, :message => "Código incorreto!")
      redirect_to contato_path, notice: "Sua mensagem foi recebida"
    else
      render 'index'
    end
  end
  
  
  def show
    @contato = Contato.find params[:id] 
  end
end
