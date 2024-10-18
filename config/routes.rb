Igobono::Application.routes.draw do

 get "my_account/popover"
    resources :communities, :only => [:show] do
      member do
        get 'request_membership'
      end
      resources :discussions do
        post 'reply'
      end
      resources :galleries, :only => [:show]
      get 'get_admins'
      get 'get_offers'
      get 'connections'
      get 'showcases'
      get 'add_to_wishlist'
    end 

 
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :admin_users, ActiveAdmin::Devise.config

 get "my_account/home"

  get "my_account/user_login"

  get "my_account/password"

  get "my_account/contact"

  get "my_account/personal"

  get "my_account/public_profile"

  get "my_account/skills"

  get "my_account/needs"

  get "my_account/bonos_history"

  get "my_account/merchant_account"

  get "my_account/default_preferences"

  get "my_account/security"

  get "my_account/cloud_connections"

  get "my_account/social_score"

  get "my_account/network_links"

  get "account_user/new"

  get "account_user/needs"

  get "account_user/skills"

  get "account_user/connections"

  match "/my_account/update", :to => "my_account#update"

  root :to => "brochure#index"

  match "/account_user/create", :to => "account_user#create"

  match "/account_user/needs_update", :to => "account_user#needs_update"

  match "/account_user/skills_update", :to => "account_user#skills_update"

  match "/account_setup", :to => "account_setup#index"

  match "/login", :to => "access#login"

  match "access/attempt_login", :to => "access#attempt_login"

  match "access/attempt_account_login", :to => "access#attempt_account_login"

  match "access/logout", :to => "access#logout"

  match "/contact", :to => "brochure#contact"

  match "/about", :to => "brochure#about"

  match "/terms", :to => "brochure#terms"

  match "/feedback/create", :to => "feedback#create"

  match "/users/create", :to => "users#create" 
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
   root :to => 'my_account#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end 
