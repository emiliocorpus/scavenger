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
  end

  def destroy
      session[:user_id] = nil
      redirect_to root_path
  end

  def show
      if !current_user || params[:id] != current_user.username
        redirect_to root_path
      end
  end

  def edit
    @user = current_user
  end
end
