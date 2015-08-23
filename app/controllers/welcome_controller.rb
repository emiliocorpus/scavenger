class WelcomeController < ApplicationController
  def index
  		if current_user
  			redirect_to profile_path(current_user)
  		end
  end
end
