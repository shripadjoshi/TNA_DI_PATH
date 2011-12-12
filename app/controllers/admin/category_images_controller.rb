class Admin::CategoryImagesController < ApplicationController
  before_filter :require_user
  layout 'admin'
  def index
    @categories = Category.root_categories
  end

  def uploadfile
    unless params[:upload].blank? and params[:category][:image].blank? and params[:category][:ids].blank?
      if CategoryImage.check_file(params[:upload])
        for item in 0..(params[:category][:ids].to_a.length-1)
          CategoryImage.save(params[:upload],params[:category][:ids][item],params[:category][:image])
        end
        flash[:error] = "Image uploaded successfully"
      else
        flash[:error] = "Please select proper image file eg. jpg,jpeg,png etc.to upload"
      end
    else
      flash[:error] = "Image not uploaded succesfully, Please fill all the fields"
    end
    redirect_to admin_category_images_path
  end
end
