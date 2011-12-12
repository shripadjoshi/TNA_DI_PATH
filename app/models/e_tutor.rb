class ETutor < ActiveRecord::Base
  #relations
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :articles

  #validations
  validates_presence_of  :content
  validates_presence_of :url
  validates_format_of :url, :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
end
