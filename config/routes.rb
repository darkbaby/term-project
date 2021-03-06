TermProject::Application.routes.draw do
root :to => 'rooms#index'
  
  post 'rooms/index'
  get 'rooms/index'
  post 'firstform' , :to => 'rooms#firstform' , :as => 'firstform'
  get 'firstform' , :to => 'rooms#firstform' , :as => 'firstform'
  post 'rooms/firstform' , :to => 'rooms#firstform' , :as => 'firstform'
  get 'rooms/firstform' , :to => 'rooms#firstform' , :as => 'firstform'
  get 'rooms/search_form', :to => 'rooms#search_form' , :as => 'search_form'
  post 'rooms/search', :to => 'rooms#search' , :as => 'search'
  get 'rooms/about', :to => 'rooms#about' , :as => 'about'
  get 'rooms/add_roomform', :to => 'rooms#add_roomform' , :as => 'add_roomform'
  post 'rooms/add_room', :to => 'rooms#add_room' , :as => 'add_room'
  get 'rooms/add_courseform', :to => 'rooms#add_courseform' , :as => 'add_courseform'
  post 'rooms/add_course', :to => 'rooms#add_course' , :as => 'add_course'
  get 'rooms/show_room', :to => 'rooms#show_room' , :as => 'show_room'
  post 'rooms/show_room', :to => 'rooms#show_room' , :as => 'show_room'
  get 'rooms/show_course', :to => 'rooms#show_course' , :as => 'show_course'
  post 'rooms/detail_room', :to => 'rooms#detail_room' , :as => 'detail_room'
  post 'rooms/destroy', :to => 'rooms#destroy' , :as => 'destroy'
  post 'rooms/edit_roomform', :to => 'rooms#edit_roomform' , :as => 'edit_roomform'
  get 'rooms/edit_roomform', :to => 'rooms#edit_roomform' , :as => 'edit_roomform'
  post 'rooms/edit_room', :to => 'rooms#edit_room' , :as => 'edit_room'
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

