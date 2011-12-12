class Article < ActiveRecord::Base
  #  Acts as list used for positioning the article element
  acts_as_list
  #All relations go here in this block
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :quotes
  has_and_belongs_to_many :e_stories
  has_and_belongs_to_many :e_tutors
  
  #validations
  validates_presence_of :name
  validates_length_of :name, :maximum => 10

#  Named socpes for Article models
  named_scope :root_articles, :conditions => ["article_parent_id = 0"], :order => "position"
  named_scope :child_articles, lambda { |article_id| {:conditions => ["article_parent_id=?",article_id], :order => "position"}}

  ####These are testing name scopes need to be removed afterwords................
  named_scope :all_articles1, lambda {|no| {:conditions => ["id >= ?",no]}.collect(&:id)}
  named_scope :all_articles, lambda {|no| {:conditions => ["id >= ?",no]}} do
    def ids
      collect(&:id)
    end
  end
  ###Testing namedscope end here

#  named_scope :spammable, :select => 'email, spam', :conditions => { :spam => true } do
#  def emails
#    collect(&:email)
#  end
#end


  ####code for sphinx goes here
#  define_index do
#    indexes name
#  end
  ###Class methods.........
  private
  #This method will find the next record (previous or next) depending parameters
  #Prameters taken by this are
  #position = position of the current article
  #article_parent_id = Article Parent ID
  #condition = this will have parameter as > or <
  #order = this will take asc or desc
  def self.find_next_article(position,article_parent_id,condition,order)
    #puts "Parent........................"
    parent_id = article_parent_id == 0 ? "article_parent_id = 0" : "article_parent_id = #{article_parent_id}"
    #puts article_parent_id
    #puts parent_id
    #puts "Parent........................"
    self.find(:first,:conditions => ["position #{condition} ? and #{parent_id}",position],:order => "position #{order}")
  end

  #This method will swap the positions,
  #Parameters taken by this method are
  #original = this will take the hash for the original article
  #swap = this will take the hash for the next article (previous or next) fetch from find_next_article method
  def self.swap_articles(original,swap)
    original_pos = original.position
    swap_pos = swap.position
    begin
     original.update_attribute(:position, swap_pos)
     swap.update_attribute(:position, original_pos)
     return true
    rescue
      original.update_attribute(:position, original_pos)
      swap.update_attribute(:position, swap_pos)
      return false
    end
  end
 

end
