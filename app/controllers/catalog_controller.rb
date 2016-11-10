class CatalogController < ApplicationController

	def category_products
		@products = Category.friendly.find(params[:name]).products
	end

	def product_detail
		
	end

end
