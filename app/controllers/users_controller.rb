class UsersController < ApplicationController
  include UsersHelper
  include SessionsHelper

  def create
      new_user_params = params[:new_user]

      if new_user_params[:password] == new_user_params[:confirm_password]
        user =  User.new(first_name: new_user_params[:first_name],
                          last_name: new_user_params[:last_name],
                          username: new_user_params[:username],
                          email: new_user_params[:email],
                          password: new_user_params[:password])
        if user.save
          log_in user
          redirect_to profile_path(user)
        else
          redirect_to root_path
        end
      else
          redirect_to root_path
      end
  end

  def update
      redirect_to root_path unless valid_user_check
  end

  def destroy
      session[:user_id] = nil
      redirect_to root_path
  end

  def show
      redirect_to root_path unless valid_user_check
      
  end

  def edit
      redirect_to root_path unless valid_user_check
  end

end
