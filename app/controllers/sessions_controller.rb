class SessionsController < ApplicationController
	include UsersHelper
  include SessionsHelper
  def create
  	user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
    		log_in user
    		redirect_to profile_path(user)
    else
    		redirect_to root_path
    end  		
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
