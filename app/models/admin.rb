class Admin < ActiveRecord::Base
	validates :name, :presence => true
	validates :email, :presence => true
	has_secure_password

	def self.stripe_publishable_key
		first.stripe_publishable_key
	end

	def self.stripe_secret_key
		first.stripe_secret_key
	end
end
