class Category < ActiveRecord::Base

  ###All plugin included in this block............
  acts_as_nested_set :order => :title

  ##All Validation included in this block
  validates_presence_of :title
  validates_uniqueness_of :title
  

  #All relations go here in this block
  has_many :category_image
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :quotes
  has_and_belongs_to_many :e_stories
  has_and_belongs_to_many :e_tutors

  ###Namespace for the categories..
  #This namescope will give all the root categories...
  named_scope :root_categories, :conditions => ["parent_id is NULL or parent_id=?",0], :order => "created_at"
  ##This named scope will give all categories by their names
  named_scope :find_category, lambda{|category_name| {:conditions => ["title =?",category_name]}}

  ###All Thinking sphinx indexes are goes here
  define_index do
    indexes title
  end
end
