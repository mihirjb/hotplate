class MumscrapurlsController < ApplicationController
  # GET /mumscrapurls
  # GET /mumscrapurls.json
  def index
    @mumscrapurls = Mumscrapurl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mumscrapurls }
    end
  end

  # GET /mumscrapurls/1
  # GET /mumscrapurls/1.json
  def show
    @mumscrapurl = Mumscrapurl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mumscrapurl }
    end
  end

  # GET /mumscrapurls/new
  # GET /mumscrapurls/new.json
  def new
    @mumscrapurl = Mumscrapurl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mumscrapurl }
    end
  end

  # GET /mumscrapurls/1/edit
  def edit
    @mumscrapurl = Mumscrapurl.find(params[:id])
  end

  # POST /mumscrapurls
  # POST /mumscrapurls.json
  def create
    @mumscrapurl = Mumscrapurl.new(params[:mumscrapurl])

    respond_to do |format|
      if @mumscrapurl.save
        format.html { redirect_to @mumscrapurl, notice: 'Mumscrapurl was successfully created.' }
        format.json { render json: @mumscrapurl, status: :created, location: @mumscrapurl }
      else
        format.html { render action: "new" }
        format.json { render json: @mumscrapurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mumscrapurls/1
  # PUT /mumscrapurls/1.json
  def update
    @mumscrapurl = Mumscrapurl.find(params[:id])

    respond_to do |format|
      if @mumscrapurl.update_attributes(params[:mumscrapurl])
        format.html { redirect_to @mumscrapurl, notice: 'Mumscrapurl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mumscrapurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mumscrapurls/1
  # DELETE /mumscrapurls/1.json
  def destroy
    @mumscrapurl = Mumscrapurl.find(params[:id])
    @mumscrapurl.destroy

    respond_to do |format|
      format.html { redirect_to mumscrapurls_url }
      format.json { head :no_content }
    end
  end
end
