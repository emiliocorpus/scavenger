Rails.application.routes.draw do
root 'welcome#index'

resources :users, :except => [:index, :new, :edit, :show], controller: "users", shallow: true do
  resources :made_hunts, controller: "hunts", :except => [:new, :create, :index] do
    resource :clues
  end

  resources :current_hunts, controller: "scavenger_hunts", :except => [:edit, :update, :new, :create, :index]

end

resources :hunts, :only => [:index, :new,  :create]

get 'my_hunts' => 'hunts#my_hunts'
get 'edit_profile' => 'users#edit'

get '/:id' => 'users#show', as: 'profile'


end
