class BoletinsController < ApplicationController
  before_filter :authenticate, :except => [:show, :index]
  respond_to :json, :html
  
  def new
    @boletim = Boletim.new
  end
  
  # Vai sempre buscar o ultimo, dessa forma, não há necessidade de ficar deletando
  def index
    @boletim = Boletim.last
  end
  
  def create
    @boletim = Boletim.new params[:boletim]
    
    if @boletim.save
      redirect_to boletins_path, notice: "Boletim adicionado"
    else
      render 'new'
    end
  end
  
  def edit
    @boletim = Boletim.find params[:id]
  end
  
  def update
    @boletim = Boletim.find params[:id]
    
    if @boletim.update_attributes params[:boletim]
      redirect_to boletins_path, notice: "Boletim atualizado"
    else
      render 'edit'
    end
  end
  
  def destroy
    @boletim = Boletim.find params[:id]
    
    if @boletim.destroy
      redirect_to boletins_path, notice: "Boletim removido!"
    else
      redirect_to boletins_path, error: "Boletim não pode ser removido!"
    end
  end
  
  def download
      @boletim = Boletim.find params[:id]
      file = open(@boletim.boletim.url)
      send_file file, 
        :filename => @boletim.boletim.file.filename,
        :type => "application/octet-stream", 
        :x_sendfile => true
    end
end
