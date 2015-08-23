class CluesController < ApplicationController
  include UsersHelper
  include SessionsHelper
  def create
    redirect_to root_path unless valid_user_check
  end

  def new
    redirect_to root_path unless valid_user_check
  end

  def edit
    redirect_to root_path unless valid_user_check
  end

  def show
    redirect_to root_path unless valid_user_check
  end

  def update
    redirect_to root_path unless valid_user_check
  end

  def destroy
    redirect_to root_path unless valid_user_check
  end
end
