class Admin::WinketbooksController < ApplicationController
  before_filter :require_user
  layout 'admin'

  # GET /winktbooks
  # GET /winktbooks.xml
  def index
    @winketbooks = Winketbook.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @winketbooks }
    end
  end

  def new
    @winketbook = Winketbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @winketbook }
    end
  end

  # POST /winktbooks
  # POST /winktbooks.xml
  def create
    @winketbook = Winketbook.new(params[:winketbook])

    respond_to do |format|
      if @winketbook.save
        flash[:notice] = 'Winktbook was successfully created.'
        format.html { redirect_to(admin_winketbook_url(@winketbook)) }
        format.xml  { render :xml => @winketbook, :status => :created, :location => @winketbook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @winketbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /winktbooks/1/edit
  def edit
    @winketbook = Winketbook.find(params[:id])
  end

  # PUT /winktbooks/1
  # PUT /winktbooks/1.xml
  def update
    @winketbook = Winketbook.find(params[:id])

    respond_to do |format|
      if @winketbook.update_attributes(params[:winketbook])
        flash[:notice] = 'Winktbook was successfully updated.'
        format.html { redirect_to(admin_winketbook_url(@winketbook)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @winketbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /winktbooks/1
  # GET /winktbooks/1.xml
  def show
    @winketbook = Winketbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @winketbook }
    end
  end

  # DELETE /winktbooks/1
  # DELETE /winktbooks/1.xml
  def destroy
    @winketbook = Winketbook.find(params[:id])
    @winketbook.destroy

    respond_to do |format|
      format.html { redirect_to(admin_winketbooks_url) }
      format.xml  { head :ok }
    end
  end

end
