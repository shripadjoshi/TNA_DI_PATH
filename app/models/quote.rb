class Quote < ActiveRecord::Base
  #Relation goes here
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :articles
  #validation goes here
  validates_presence_of :content
  validates_presence_of :speaker

end
