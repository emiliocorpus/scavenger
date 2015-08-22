class Hunt < ActiveRecord::Base
  
  validates_presence_of :description, :vicinity

  belongs_to :user
  has_many :clues
end
