require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  
  test "the title should be present" do
    role = Role.new
    role.title = "user"
    assert role.save!
  end

  
end
