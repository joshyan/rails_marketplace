class Seller < ActiveRecord::Base
	has_many :products
	has_many :order_products
	
	validates :seller_name, :presence => true
	validates :email, :presence => true
	has_secure_password

end
