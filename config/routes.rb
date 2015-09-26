Rails.application.routes.draw do

  #Mercury::Engine.routes
  #get 'categories/index'

  #get 'categories/show'

  #get 'categories/new'

  #get 'categories/edit'

  #get 'categories/delete'

  #get 'posts/index'

  #get 'posts/show'

  #get 'posts/new'

  #get 'posts/edit'

  #get 'posts/delete'

root "public#index"

get "/about/" => "public#about"
get "/contact/" => "public#contact"
#get "/events/" => "public#events"

get 'show/:permalink', :to => 'public#show'
get 'admin', :to => "access#index"

#default routes
match ':controller(/:action(/:id))', :via => [:get, :post]

  #get 'manage_events/index'

  #get 'manage_events/show'

  #get 'manage_events/new'

  #get 'manage_events/edit'

  #get 'manage_events/delete'

  #get 'manage_news/index'

  #get 'manage_news/show'

  #get 'manage_news/new'

  #get 'manage_news/edit'

  #get 'manage_news/delete'

  #get 'access/index'

  #get 'public/index'

  #get 'admin_users/index'

  #get 'admin_users/show'

  #get 'admin_users/new'

  #get 'admin_users/edit'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
