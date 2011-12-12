require 'config/environment'

namespace :tnadi do
  namespace :roles do
    namespace :defaults do
      desc "Create default roles"
      task :create do
       Role.create :title => "admin"
       Role.create :title => "user"
      end
    end
  end

  namespace :user do
    namespace :admin do
      desc "Create default Admin user"
      task :create do
        begin
          user = User.new(
            :login => "admin",
            :password => "admin",
            :password_confirmation => "admin",
            :email => "admin@tnadi.com"
          )
          role = Role.find_role("admin")
          user.roles << role
          user.save!
        rescue ActiveRecord::UnknownAttributeError => e
          puts e.message
          puts "Please re-run rake db:migrate again."
          raise e
        rescue => e
          puts "Safe to ignore. Associated tables not created yet."
          puts e.inspect
          puts e.message
          puts e.backtrace.join("\n")
        end
      end
    end
  end
end

