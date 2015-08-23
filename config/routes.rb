Rails.application.routes.draw do
	root 'welcome#index'
	post 'login' => 'sessions#create'
	delete 'sessions/:id' => 'sessions#destroy', as: 'logout' 

	get 'edit_profile' => 'users#edit'
	get 's/:id' => 'users#show', as: 'profile'
	post 'users/new' => 'users#create', as: 'sign_up'
	get 'hunts/' => 'hunts#index', as: 'hunts'
	

	resources :s, :except => [:index, :new, :edit, :show, :create], controller: "users", shallow: true 

	resources :hunts, controller: "hunts", :except => [:index, :new] do
			    resources :clues
	end


end
