class EducacionaisController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html
  
  def new
    @educacional = Educacional.new
  end
  
  def create
    @educacional = Educacional.new(params[:educacional])
    
    if @educacional.save
      respond_with @educacional
    else
      render 'new'
    end
  end
  
  def show
    @educacional = Educacional.find params[:id]
  end
  
  def edit
    @educacional = Educacional.find params[:id]
  end
  
  def update
     @educacional = Educacional.find params[:id]
      if @educacional.update_attributes(params[:educacional])
        flash[:notice] = "Pagina atualizada"
        respond_with @educacional
      else
        render 'edit'
      end
  end
  
  def destroy
    @educacional = Educacional.find(params[:id])
    @educacional.destroy
    
    redirect_to root_path
  end
end
