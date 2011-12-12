class Admin::WinketchaptersController < ApplicationController
  before_filter :require_user
  layout 'admin'

    # GET /winktchapters
  # GET /winktchapters.xml
  def index
    @winketchapters = Winketchapter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @winketchapters }
    end
  end

  # GET /winktchapters/new
  # GET /winktchapters/new.xml
  def new
    @winketchapter           = Winketchapter.new
    @winketchapter.winketbook = Winketbook.find(params[:winketbook_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @winketchapter }
    end
  end

  # POST /winktchapters
  # POST /winktchapters.xml
  def create
    @winketchapter = Winketchapter.new(params[:winketchapter])
    respond_to do |format|
      if @winketchapter.save
        flash[:notice] = 'Winktchapter was successfully created.'
        format.html { redirect_to(admin_winketchapter_url(@winketchapter)) }
        format.xml  { render :xml => @winketchapter, :status => :created, :location => @winketchapter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @winketchapter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /winktchapters/1
  # GET /winktchapters/1.xml
  def show
    @winketchapter = Winketchapter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @winketchapter }
    end
  end

  # DELETE /winktchapters/1
  # DELETE /winktchapters/1.xml
  def destroy
    @winketchapter = Winketchapter.find(params[:id])
    @winketchapter.destroy

    respond_to do |format|
      format.html { redirect_to(admin_winketchapters_url) }
      format.xml  { head :ok }
    end
  end

end
