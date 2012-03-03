Potoyook::Application.routes.draw do
  
  devise_for :users, :controllers => {:registrations => "registrations"}

  root :to => 'home#welcome'
  resources  :projects 
  resources :users
  resources :albums do 
    resources :pictures
  end
  
  
  match 'dashboard' => "home#dashboard", :as => :dashboard 
  
  
=begin
  To upload images
=end
  match 'upload_more_pictures/album/:album_id' => "pictures#upload_more_pictures", :as => :upload_more_pictures, :method => :post
  match 'select_cover_image/album/:album_id' => "pictures#select_cover_image", :as => :select_cover_image
  match 'execute_select_cover_album' => "pictures#execute_select_cover", :as => :execute_select_cover, :method => :post
 
 
=begin
  To view the album's images
=end
  match 'see_album_content/:album_id' => "albums#see_album_content", :as => :see_album_content 
  
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
  # match ':controller(/:action(/:id(.:format)))'
end
