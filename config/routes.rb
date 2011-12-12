ActionController::Routing::Routes.draw do |map|
  ##Route for main page
  map.root :controller => "application"
  #Route for main page ends here

  ###Routes for user session
  map.resource :user_session
  #map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
  #Routes for user session ends here

  #Routes for the users
  map.resource :account, :controller => "users"
  map.resources :users
  #Routes for the users end here

  ###Routes for mailer related activities
  map.register '/register/:activation_code', :controller => 'activations', :action => 'new'
  map.activate '/activate/:id', :controller => 'activations', :action => 'create'
  ###Routes for mailer related activities end here

  ##Routes for password reset
  map.resources :password_resets, :only => [ :new, :create, :edit, :update ]
  ###Route for password reset end here

  ##Routes for admin go here
  map.namespace :admin do |admin|
    admin.resource :admin_session
    admin.resources :users
    admin.resources :categories, :collection => {:search => :post, :autocomplete_search => :get}
    admin.resources :category_images, :collection => {:uploadfile => :get}
    admin.resources :articles, :collection => {:sort => :post} , :member => {:down => :get, :up => :get,:add_child => :get, :remove_child => :get}
    admin.resources :quotes,:member =>{:change_fav => :get}
    admin.resources :e_stories,:member =>{:change_fav => :get}
    admin.resources :e_tutors,:member =>{:change_fav => :get}
    admin.resources :winketbooks, :has_many => :winketchapters
    admin.resources :winketchapters, :has_many => :winkets
    admin.resources :wikets
    admin.login "/", :controller => "admin_sessions", :action => "new"
    admin.welcome "welcome", :controller => "welcome", :action => "index"
    admin.logout "logout", :controller => "admin_sessions", :action => "destroy"
    admin.connect ":controller/:action/:id"
  end
  #Routes for admin end here
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
