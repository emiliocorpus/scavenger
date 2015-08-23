class CluesController < ApplicationController
  include UsersHelper
  include SessionsHelper
  def create
    valid_user_check
  end

  def new
    valid_user_check
  end

  def edit
    valid_user_check
  end

  def show
    valid_user_check
  end

  def update
    valid_user_check
  end

  def destroy
    valid_user_check
  end
end
