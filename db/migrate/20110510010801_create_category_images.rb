class CreateCategoryImages < ActiveRecord::Migration
  def self.up
    create_table :category_images do |t|
      t.integer :category_id
      t.string :image_path
      t.string :type_name
      t.timestamps
    end
  end

  def self.down
    drop_table :category_images
  end
end
