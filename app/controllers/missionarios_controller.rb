class MissionariosController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html

  def new
    @missionario = Missionario.new
  end

  def create
    @missionario = Missionario.new(params[:missionario])

    if @missionario.save
      respond_with @missionario
    else
      render 'new'
    end
  end

  def show
    @missionario = Missionario.find params[:id]
  end

  def edit
    @missionario = Missionario.find params[:id]
  end

  def destroy
    @missionario = Missionario.find(params[:id])
    @missionario.destroy
    
    redirect_to root_path
  end

  def update
    @missionario = Missionario.find params[:id]
    if @missionario.update_attributes(params[:missionario])
      flash[:notice] = "Pagina atualizada"
      respond_with @missionario
    else
      render 'edit'
    end
  end
end
