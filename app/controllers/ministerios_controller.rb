class MinisteriosController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  
  def index
    @ministerios = Ministerio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ministerios }
    end
  end

  def show
    @ministerio = Ministerio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ministerio }
    end
  end

  def new
    @ministerio = Ministerio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ministerio }
    end
  end

  def edit
    @ministerio = Ministerio.find(params[:id])
  end

  def create
    @ministerio = Ministerio.new(params[:ministerio])

    respond_to do |format|
      if @ministerio.save
        format.html { redirect_to @ministerio, notice: 'Ministerio was successfully created.' }
        format.json { render json: @ministerio, status: :created, location: @ministerio }
      else
        format.html { render action: "new" }
        format.json { render json: @ministerio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @ministerio = Ministerio.find(params[:id])

    respond_to do |format|
      if @ministerio.update_attributes(params[:ministerio])
        format.html { redirect_to @ministerio, notice: 'Ministerio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ministerio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ministerio = Ministerio.find(params[:id])
    @ministerio.destroy

    respond_to do |format|
      format.html { redirect_to ministerios_url }
      format.json { head :no_content }
    end
  end
end
