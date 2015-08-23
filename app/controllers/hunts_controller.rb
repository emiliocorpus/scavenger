class HuntsController < ApplicationController
  include UsersHelper
  include SessionsHelper
  def edit
      redirect_to root_path unless valid_user_check
  end

  def show
    if valid_user_check
      @hunt = Hunt.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    valid_user_check
  end

  def index
    if valid_user_check
        @hunts = Hunt.where.not(user_id: current_user.id)
    else
        redirect_to root_path
    end
  end

  def create
    redirect_to root_path unless valid_user_check
  end

  def new
    redirect_to root_path unless valid_user_check
  end

  def my_hunts
    redirect_to root_path unless valid_user_check
  end
end
