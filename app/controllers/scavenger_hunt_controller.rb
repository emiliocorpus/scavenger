class ScavengerHuntController < ApplicationController
  include UsersHelper
  include SessionsHelper
  def show
  		valid_user_check
  end

  def destroy
  		valid_user_check
  end

  def create
  		valid_user_check
  end
end
