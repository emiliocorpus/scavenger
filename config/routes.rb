Rails.application.routes.draw do
	root 'welcome#index'
	post 'login' => 'sessions#create'
	delete 'sessions/:id' => 'sessions#destroy', as: 'logout' 

	get 's/:id/edit' => 'users#edit', as: "edit_profile"
	
	post 'users/new' => 'users#create', as: 'sign_up'
	get 'hunts/' => 'hunts#index', as: 'hunts'
	

	resources :s, :except => [:index, :new, :edit, :create], controller: "users", shallow: true 

	resources :hunts, controller: "hunts", :except => [:index, :new] do
			    resources :clues
	end

	get 's/:id' => 'users#show', as: 'profile'
end
