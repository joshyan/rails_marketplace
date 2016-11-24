class Customer < ActiveRecord::Base
	has_one :cart
	has_many :orders
end
