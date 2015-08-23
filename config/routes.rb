Rails.application.routes.draw do
	root 'welcome#index'
	post 'login' => 'sessions#create'
	delete 'sessions/:id' => 'sessions#destroy', as: 'logout' 
	

		resources :users, controller: "users", :except => [:index, :new, :edit, :create, :show], path: '/' do 
			resources :scavenger_hunts, controller: "scavenger_hunts", :only => [:index, :show, :destroy, :delete]
		end
		resources :hunts, controller: "hunts" do
				    resources :clues
		end

	post 'users/new' => 'users#create', as: 'sign_up'
	get ':id/edit' => 'users#edit', as: "edit_profile"
	get ':id' => 'users#show', as: 'profile'
	post "/:user_id/hunts/:hunt_id/new" => "scavenger_hunt#create", as: 'start_new_hunt'

end
