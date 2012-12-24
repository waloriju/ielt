class BannersController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html
  
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
end
