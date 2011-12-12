class Admin::EStoriesController < ApplicationController
  before_filter :require_user
  layout 'admin'

  def index
    @e_stories = EStory.find :all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @e_stories }
    end
  end

  def new
    @e_story = EStory.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @e_story }
    end
  end

  def create
    @e_story = EStory.new(params[:e_story])
    respond_to do |format|
      if @e_story.save
        flash[:notice] = 'E-Story was successfully created.'
        format.html { redirect_to(admin_e_stories_path) }
        format.xml  { render :xml => @e_story, :status => :created, :location => @e_story }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @e_story.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @e_story = EStory.find(params[:id])
  end

  def update
    @e_story = EStory.find(params[:id])
    respond_to do |format|
      if @e_story.update_attributes(params[:e_story])
        flash[:notice] = 'E-Story was successfully updated.'
        format.html { redirect_to(admin_e_stories_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @e_story.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @e_story = EStory.find(params[:id])
    @e_story.destroy
    respond_to do |format|
      format.html { redirect_to(admin_e_stories_url) }
      format.xml  { head :ok }
    end
  end

  def change_fav
    @e_story = EStory.find(params[:id])
    @e_story.update_attributes(:sys_favourite => !@e_story.sys_favourite)
    respond_to do |format|
      format.js do
        render :update do |page|
          page.replace_html "favourite_#{params[:id]}", :partial => 'favourite', :locals => {:e_story => @e_story}
          @e_story.sys_favourite? ? page << "alert('E-Story was successfully marked as Sys. Favourite.');" : page << "alert('E-Story was successfully un-marked as sys. Favourate.');"
        end
      end
    end
  end

end
