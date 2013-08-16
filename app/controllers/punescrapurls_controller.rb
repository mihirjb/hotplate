class PunescrapurlsController < ApplicationController
  # GET /punescrapurls
  # GET /punescrapurls.json
  
  before_filter :authenticate_admin!
  
  
  def index
    @punescrapurls = Punescrapurl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @punescrapurls }
    end
  end

  # GET /punescrapurls/1
  # GET /punescrapurls/1.json
  def show
    @punescrapurl = Punescrapurl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @punescrapurl }
    end
  end

  # GET /punescrapurls/new
  # GET /punescrapurls/new.json
  def new
    @punescrapurl = Punescrapurl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @punescrapurl }
    end
  end

  # GET /punescrapurls/1/edit
  def edit
    @punescrapurl = Punescrapurl.find(params[:id])
  end

  # POST /punescrapurls
  # POST /punescrapurls.json
  def create
    @punescrapurl = Punescrapurl.new(params[:punescrapurl])

    respond_to do |format|
      if @punescrapurl.save
        format.html { redirect_to @punescrapurl, notice: 'Punescrapurl was successfully created.' }
        format.json { render json: @punescrapurl, status: :created, location: @punescrapurl }
      else
        format.html { render action: "new" }
        format.json { render json: @punescrapurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /punescrapurls/1
  # PUT /punescrapurls/1.json
  def update
    @punescrapurl = Punescrapurl.find(params[:id])

    respond_to do |format|
      if @punescrapurl.update_attributes(params[:punescrapurl])
        format.html { redirect_to @punescrapurl, notice: 'Punescrapurl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @punescrapurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /punescrapurls/1
  # DELETE /punescrapurls/1.json
  def destroy
    @punescrapurl = Punescrapurl.find(params[:id])
    @punescrapurl.destroy

    respond_to do |format|
      format.html { redirect_to punescrapurls_url }
      format.json { head :no_content }
    end
  end
end
