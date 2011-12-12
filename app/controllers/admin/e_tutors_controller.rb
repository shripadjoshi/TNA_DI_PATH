class Admin::ETutorsController < ApplicationController
  before_filter :require_user
  layout 'admin'

  def index
    @e_tutors = ETutor.find :all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @e_tutors }
    end
  end

  def new
    @e_tutor = ETutor.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @e_tutor }
    end
  end

  def create
    @e_tutor = ETutor.new(params[:e_tutor])
    respond_to do |format|
      if @e_tutor.save
        flash[:notice] = 'E-Tutor was successfully created.'
        format.html { redirect_to(admin_e_tutors_path) }
        format.xml  { render :xml => @e_tutor, :status => :created, :location => @e_tutor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @e_tutor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @e_tutor = ETutor.find(params[:id])
  end

  def update
    @e_tutor = ETutor.find(params[:id])
    respond_to do |format|
      if @e_tutor.update_attributes(params[:e_tutor])
        flash[:notice] = 'E-Tutor was successfully updated.'
        format.html { redirect_to(admin_e_tutors_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @e_tutor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @e_tutor = ETutor.find(params[:id])
    @e_tutor.destroy
    respond_to do |format|
      format.html { redirect_to(admin_e_tutors_url) }
      format.xml  { head :ok }
    end
  end

    def change_fav
    @e_tutor = ETutor.find(params[:id])
    @e_tutor.update_attributes(:sys_favourite => !@e_tutor.sys_favourite)
    respond_to do |format|
      format.js do
        render :update do |page|
          page.replace_html "favourite_#{params[:id]}", :partial => 'favourite', :locals => {:e_tutor => @e_tutor}
          @e_tutor.sys_favourite? ? page << "alert('E-Story was successfully marked as Sys. Favourite.');" : page << "alert('E-Story was successfully un-marked as sys. Favourate.');"
        end
      end
    end
  end

end
