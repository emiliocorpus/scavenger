Rails.application.routes.draw do
	root 'welcome#index'
	post 'login' => 'sessions#create'
	delete 'sessions/:id' => 'sessions#destroy', as: 'logout' 
	get 'hunts/' => 'hunts#index', as: 'hunts'


		resources :users, :except => [:index, :new, :edit, :create, :show], controller: "users", path: '/' do 

			resources :hunts, controller: "hunts", :except => [:index] do
					    resources :clues
			end
		end
	

	post 'users/new' => 'users#create', as: 'sign_up'
	get ':id/edit' => 'users#edit', as: "edit_profile"
	get ':id' => 'users#show', as: 'profile'

end
