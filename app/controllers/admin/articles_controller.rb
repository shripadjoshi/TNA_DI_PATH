class Admin::ArticlesController < ApplicationController
 before_filter :require_user
  layout 'admin'

  def index
    @articles = Article.root_articles
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    @articles = Article.root_articles
    @categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # POST /articles
  # POST /articles.xml
  def create
    @articles = Article.root_articles
    @article = Article.new(params[:article])
    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(admin_articles_path) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

   # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @articles = Article.root_articles
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(admin_articles_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(admin_articles_url) }
      format.xml  { head :ok }
    end
  end
  ###Additional methods............
  #
  ####This method will call during drag and drop operations for root articles
  def sort
    @articles_array = params[:article].to_a
    @articles_array.each_with_index do |a,index|
      @article = Article.find(a.to_i)
      @article.update_attributes!(:position => index+1)
    end
    render :nothing => true
  end
  #This will move the order of the id up by one
  #(we can use move_higher method but if we delete one record in between it will not move the record higher)
  def up
    @article = Article.find(params[:id])
    @next_article = Article.find_next_article(@article.position,@article.article_parent_id,"<","desc")
    if Article.swap_articles(@article,@next_article)
     flash[:notice] = "Article order changed, it has moved up by one"
    else
      flash[:notice] = "Article order not changed"
    end
    redirect_to admin_articles_path
  end
  #This will move the order of the id down by one
  #(we can use move_lower method but if we delete one record in between it will not move the record lower)
  def down
    @article = Article.find(params[:id])
    @next_article = Article.find_next_article(@article.position,@article.article_parent_id,">","asc")
    if Article.swap_articles(@article,@next_article)
     flash[:notice] = "Article order changed, it has moved down by one"
    else
      flash[:notice] = "Article order not changed"
    end
     redirect_to admin_articles_path
  end

  #This will add the child article for the selected article and will call the create method of the article
  # GET /articles/add_child
  # GET /articles/add_child.xml
  def add_child
    @article = Article.new
    @articles = Article.root_articles
    #@categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  def remove_child
    @article= Article.find(params[:id])
    @last_parent = Article.root_articles.last
    @article.article_parent_id = 0
    @article.position = @last_parent.position.to_i + 1
    @article.save
    ##    @article.update_attribute(:article_parent_id, "NULL", :position, 100)
    redirect_to admin_articles_path
  end
end
