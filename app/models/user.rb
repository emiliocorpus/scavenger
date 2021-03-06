class User < ActiveRecord::Base
	has_secure_password

	validates_presence_of :first_name, :last_name, :username, :email, :password, :on => :create
	validates :username, :uniqueness => true, :length => { :in => 3..20}
	validates :email, :uniqueness => true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	has_many :hunts
	has_many :scavenger_hunts

	def to_param
		username
	end

end
