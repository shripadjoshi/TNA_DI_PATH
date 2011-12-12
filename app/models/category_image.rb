class CategoryImage < ActiveRecord::Base
  #All Relation go here......
  belongs_to :categories

  # Arrays uesd
  IMAGE_TYPES = ['H1','H4','Mouse Hover']

  def self.check_file(upload)
    name =  upload['category_image'].original_filename
    extention_name = name.to_s.split(".")[1]
    if (extention_name == "jpeg" or extention_name == "jpg" or extention_name == "png" or extention_name == "gif" or extention_name =="tif" or extention_name == "tiff" )
      return true
    else
      return false
    end
  end

  def self.save(upload,cat_id,type)
    name =  upload['category_image'].original_filename
    if type=="Mouse Hover"
      savedpath = "/mouse_hover/#{name}"
      directory = "public/mouse_hover"
    end
    if type=='H1'
      savedpath = "/h1/#{name}"
      directory = "public/h1"
    end
    if type=='H4'
      savedpath = "/h4/#{name}"
      directory = "public/h4"
    end
    path = File.join(directory, name)
    if !File.exist?(path)
      File.open(path, "wb") { |f| f.write(upload['category_image'].read)
        f.close
      }
    end
    if !(self.find(:first,:conditions=>["category_id=? and type_name = ?",cat_id,type])).blank?
      self.find(:first,:conditions=>["category_id=? and type_name = ?",cat_id,type]).destroy
    end
    @category_image=self.new
    @category_image.category_id = cat_id
    @category_image.image_path = savedpath
    @category_image.type_name = type
    @category_image.save
    return true
  end
end
