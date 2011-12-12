module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /the homepage/
      root_path
    when /the admin homepage/
      admin_login_path
   # Add more page name => path mappings here
#    when /the list of categories/
#      admin_categories_path
    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end
##Following for cucumber 0.2.2
#World do |world|
#  world.extend NavigationHelpers
#  world
#end
##Following for cucumber 0.3.0
World(NavigationHelpers)
