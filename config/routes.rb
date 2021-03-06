Rails.application.routes.draw do

  root to: "home#index"
  get 'tech-news', to: 'home#tech_news'

  resources :topics, only: [:index, :show]

  #creating a custom route
  resources :blogs do
    member do
      post :toggle_status
    end
  end

  resources :portfolioos, except: [:index, :new, :show]
  get 'ror', to: 'portfolioos#ruby'
  get '/portfolio', to: 'portfolioos#index', as: 'portfolio'
  get '/portfolio/new', to: 'portfolioos#new', as: 'new_portfolio'
  get 'portfolio/:id', to: 'portfolioos#show', as: 'portfolio_show'



  devise_for :users, path: '', path_names: { sign_in: 'login',
  sign_out: 'logout', sign_up: 'register'}

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
