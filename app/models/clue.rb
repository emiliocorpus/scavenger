class Clue < ActiveRecord::Base
  validates_presence_of :description, :location, :answer	
  belongs_to :hunt
end
