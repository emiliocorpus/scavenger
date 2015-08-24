class ScavengerHuntController < ApplicationController
  include UsersHelper
  include SessionsHelper
  def show
  		redirect_to root_path unless valid_user_check
      @hunt = ScavengerHunt.find(params[:id]).hunt
  end

  def destroy
  		redirect_to root_path unless valid_user_check
  end

  def create
      p params
      current_user.scavenger_hunts.create(hunt_id: params[:hunt_id])
      redirect_to root_path
  end

  def index
      @user_scav_hunts = current_user.scavenger_hunts
  end

end
