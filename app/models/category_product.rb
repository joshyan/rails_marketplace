class CategoryProduct < ActiveRecord::Base
	belongs_to :category, :inverse_of => :category_products
	belongs_to :product, :inverse_of => :category_products
end
