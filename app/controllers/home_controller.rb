class HomeController < ApplicationController
  
  def index
    render params[:id]
  end
end
