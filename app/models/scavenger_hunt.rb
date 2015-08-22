class ScavengerHunt < ActiveRecord::Base
  belongs_to :user
  belongs_to :hunt
end
