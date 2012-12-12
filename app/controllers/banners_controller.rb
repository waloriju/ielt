class BannersController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  respond_to :json, :html
  
  def new
    @banner = Banner.new
  end
end
