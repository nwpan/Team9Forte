Rails.application.routes.draw do
  devise_for :employers
  devise_for :agencies
  devise_for :users
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
  resources :welcome

  get 'portal', :to => 'welcome#portal'

  resources :users do
    get 'profile'
  end

  resources :tasks do
    collection do
      post "apply"
    end
  end

  resources :classes do
    collection do
      post "apply"
      post "approve"
      post "deny"
    end
  end

  resources :user_badges

  resources :employers

  resources :agencies

  resources :search do
    collection do
      get "location"
      get "tasks"
    end
  end

  resources :dashboard

  get  '/courses/new',     to: 'classes#new'
  post '/courses',         to: 'classes#create'

  root to: "welcome#index"

end
