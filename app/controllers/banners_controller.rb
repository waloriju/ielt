class BannersController < ApplicationController
  before_filter :authenticate, :except => :show
  respond_to :json, :html

  def index
    @banners = Banner.order_by(['created_at', 'desc']).paginate(:per_page => 3, :page => params[:page])
  end

  def edit
    @banner = Banner.find params[:id]
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new params[:banner]

    if @banner.save
      respond_with @banner
    else
      render 'new'
    end
  end

  def update
    @banner = Banner.find params[:id]

    if @banner.update_attributes params[:banner]
      redirect_to root_path, notice: "Banner atualizado"
    else
      render 'edit'
    end
  end

  def destroy
    @banner = Banner.find params[:id]

    if @banner.destroy
      redirect_to root_path, notice: "Banner removido!"
    else
      redirect_to banners_path, error: "Ocorreu um erro ao remover o banner"
    end
  end
end
