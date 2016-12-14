Rails.application.routes.draw do
  get 'likes/index'

  # resources :users
  get '/users/index' => 'users#index'
  get '/users/new' => 'users#new'
  post '/users/create' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/sessions/index' => 'sessions#index'
  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#login'
  delete '/sessions' => 'sessions#logout'

  get '/secrets' => 'secrets#index'
  get '/secrets/new' => 'secrets#new'
  post '/secrets' => 'secrets#create'
  # get '/secrets/:id' => 'secrets#show'
  delete '/secrets/:id' => 'secrets#destroy'

  get 'likes/index' => 'likes#index'
  post '/likes' => 'likes#create'
  delete '/likes' =>  'likes#destroy'

  # post '/userlikes' => 'likes#createlike'
  # delete '/userlikes' => 'likes#delete'

  # get '/secrets/new' => 'users#show'
  # post '/secrets/'
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
