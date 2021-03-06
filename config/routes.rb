Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'users#show', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  
  resources :songs 
 
  resources :users

  resources :versions
  get 'versions/:id/download' => 'versions#download', :as => :version_download
  get 'versions/:id/make_master' => 'versions#make_master', :as => :make_master
  resources :comments

  resources :team_members

  post '/users/search' => 'users#search'

  namespace :api do
    namespace :v1 do
      get '/users' => 'users#index'
      get '/team_members/:song_id' => 'users#team_members'
      get '/versions/:id/comments' => 'comments#index'
      post '/versions/:id/comments' => 'comments#create'
      #get '/voices' => 'voices#index'
      get '/voices' => 'voices#show'
    end
  end

  get '/search' => 'searches#index'


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
