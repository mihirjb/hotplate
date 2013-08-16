class BlorescrapurlsController < ApplicationController
  
  before_filter :authenticate_admin!
  # GET /blorescrapurls
  # GET /blorescrapurls.json
  def index
    @blorescrapurls = Blorescrapurl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blorescrapurls }
    end
  end

  # GET /blorescrapurls/1
  # GET /blorescrapurls/1.json
  def show
    @blorescrapurl = Blorescrapurl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blorescrapurl }
    end
  end

  # GET /blorescrapurls/new
  # GET /blorescrapurls/new.json
  def new
    @blorescrapurl = Blorescrapurl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blorescrapurl }
    end
  end

  # GET /blorescrapurls/1/edit
  def edit
    @blorescrapurl = Blorescrapurl.find(params[:id])
  end

  # POST /blorescrapurls
  # POST /blorescrapurls.json
  def create
    @blorescrapurl = Blorescrapurl.new(params[:blorescrapurl])

    respond_to do |format|
      if @blorescrapurl.save
        format.html { redirect_to @blorescrapurl, notice: 'Blorescrapurl was successfully created.' }
        format.json { render json: @blorescrapurl, status: :created, location: @blorescrapurl }
      else
        format.html { render action: "new" }
        format.json { render json: @blorescrapurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blorescrapurls/1
  # PUT /blorescrapurls/1.json
  def update
    @blorescrapurl = Blorescrapurl.find(params[:id])

    respond_to do |format|
      if @blorescrapurl.update_attributes(params[:blorescrapurl])
        format.html { redirect_to @blorescrapurl, notice: 'Blorescrapurl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blorescrapurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blorescrapurls/1
  # DELETE /blorescrapurls/1.json
  def destroy
    @blorescrapurl = Blorescrapurl.find(params[:id])
    @blorescrapurl.destroy

    respond_to do |format|
      format.html { redirect_to blorescrapurls_url }
      format.json { head :no_content }
    end
  end
end
