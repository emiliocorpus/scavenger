class HuntsController < ApplicationController
  include UsersHelper
  include SessionsHelper
  def edit
      valid_user_check
  end

  def show
    valid_user_check
  end

  def update
    valid_user_check
  end

  def index
    valid_user_check
  end

  def create
    valid_user_check
  end

  def new
    
  end

  def my_hunts
    valid_user_check
  end
end
