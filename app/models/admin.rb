class Admin < ActiveRecord::Base
	validates :name, :presence => true
	validates :email, :presence => true
	has_secure_password
end
