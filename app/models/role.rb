class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates_presence_of :title
  private
  def self.find_role(role)
    Role.find_by_title(role)
  end
end
