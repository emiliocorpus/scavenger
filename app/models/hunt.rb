class Hunt < ActiveRecord::Base
  
  validates_presence_of :description, :longitude, :latitude

  belongs_to :user
  has_many :clues, dependent: :destroy
  has_many :scavenger_hunts, dependent: :destroy

end
