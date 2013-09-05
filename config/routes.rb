Hotplate::Application.routes.draw do



  get "potentialusers/create"

  get "beentheres/create"

  get "beentheres/destroy"

  get "beetheres/create"

  get "beetheres/destroy"

  get "favorites/decide"

  resources :mumscrapurls


  resources :blorescrapurls


  resources :punescrapurls


  devise_for :admins

  devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  
  get "pages/thankyou"
  get "pages/userorderdetails"
  get "pages/transactionhistory"
  get "pages/success"
  get "pages/failure"
  get "pages/searchresults"
  
  # devise_for :admins

 # devise_for :admins

  root :to => 'pages#home'
       resources :restaurants
       match 'menuitems/new/:id',  :to => 'menuitems#new', :as => :new_menuitem 
       match 'orders/inspect',  :to => 'orders#inspect'
       match 'pages/orderconfirmation',  :to => 'pages#orderconfrimation', :as => :confirm_order_url 
       
       resources :menuitems
       resources :orders
       resources :orderitems
       resources :reviews
       get "favorites/create"

        get "favorites/destroy"

resources :favorites       
       devise_for :admins, :controllers => { :registrations => "admins/registrations" }
       match "/favorites/:restaurant_id" => "favorites#decide", :as => :favorite
       match "/beentheres/:restaurant_id" => "beentheres#create", :as => :beenthere
       match "/potentialusers/:restaurant_id" => "potentialusers#create", :as => :potentialuser
       match "/jampotentialusers" => "jampotentialusers#create"
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
