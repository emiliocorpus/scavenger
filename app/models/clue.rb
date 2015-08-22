class Clue < ActiveRecord::Base
  validates_presence_of :description, :longitude, :latitude, :answer	
  belongs_to :hunt
end
