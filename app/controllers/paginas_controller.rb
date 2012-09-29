class PaginasController < ApplicationController

  def edit
    @pagina = Pagina.find(params[:id])
  end

  def update
    @pagina = Pagina.find(params[:id])
    if @pagina.update_attributes(params[:pagina])
      redirect_to painel_path, notice: "Pagina atualizada"
    else
      render 'edit'
    end
  end
end
