class SessionsController < ApplicationController
	include SessionsHelper
  def create
  	p params
  	
  	user = User.find_by(username: params[:session][:username])
  	
  	if user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to profile_path(user)
  	else
  		redirect_to root_path
  	end  		
  end

  def destroy

  end
end
