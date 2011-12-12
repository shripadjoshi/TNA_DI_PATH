class Admin::CategoriesController < InheritedResources::Base
  before_filter :require_user
  layout 'admin'
  ###All the methods are generated automatically by extending to InheritedResources::Base

  ### override the create method to redirect to index page
  def create
    create! {
      ##This extra logic is written for storing parent id
      @category.update_attributes(:parent_id => params[:parent][:id]) if params[:parent][:id].to_i > 0
      admin_categories_path
      }
  end

  ### override the update method to redirect to index page
  def update
    update! {
      ##This code will update parent Id of category
      params[:parent][:id] = params[:parent][:id].to_i > 0 ? params[:parent][:id] : ""
      @category.update_attributes(:parent_id => params[:parent][:id])
      admin_categories_path
      }
  end

  def search
    if params[:searchstring]
      @categories = Category.search params[:searchstring], :star => true
      flash[:error] = "No record found for entered search string" if @categories.blank?
    else
      redirect_to admin_categories_path
    end
  end
  
end
