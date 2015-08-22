Rails.application.routes.draw do

  get 'scavenger_hunt/show'

  get 'scavenger_hunt/destroy'

  get 'scavenger_hunt/create'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  get 'users/show'

  get 'users/edit'

  get 'hunts/edit'

  get 'hunts/show'

  get 'hunts/update'

  get 'hunts/index'

  get 'hunts/create'

  get 'hunts/new'

  get 'hunts/my_hunts'

  get 'clues/create'

  get 'clues/new'

  get 'clues/edit'

  get 'clues/show'

  get 'clues/update'

  get 'clues/destroy'

  get 'welcome/index'

  root 'welcome#index'

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

resources :users, :except => [:index, :new, :edit, :show], controller: "users", shallow: true do
  resources :made_hunts, controller: "hunts", :except => [:new, :create, :index] do
    resource :clues
  end

  resources :current_hunts, controller: "scavenger_hunts", :except => [:edit, :update, :new, :create, :index]

end

resources :hunts, :only => [:index, :new,  :create]

get 'my_hunts' => 'hunts#my_hunts'
get 'edit_profile' => 'users#edit'

get '/:id' => 'user#show', as: 'profile'


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
