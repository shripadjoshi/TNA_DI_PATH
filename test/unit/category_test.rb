require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  fixtures :categories

  # Following test will test the the title present or not
  test "should not save category without title" do
    category = Category.new
    assert !category.save, "Save the category without title"
  end

  #Following test will test the uniqueness of the title
  test "should have unique category name" do
    category = Category.new
    category.title = "one"
    assert !category.save, "Category title should be unique"
  end
  
end
