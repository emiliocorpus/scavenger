module UsersHelper

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def current_hunts
		current_user.scavenger_hunts
	end

	def my_hunts
		current_user.hunts
	end

	def valid_user_check
		if !current_user
		  redirect_to root_path
		end
	end

end
