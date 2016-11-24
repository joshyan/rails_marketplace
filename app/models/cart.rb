class Cart < ActiveRecord::Base
	has_many :cart_products, :dependent => :destroy
	has_many :products, :through => :cart_products
	belongs_to :customer

	def add_product(product_id, quantity)
	  cart_product = cart_products.where('product_id = ?', product_id).first
	  if cart_product
	    # increase the quantity of product in cart
	    cart_product.quantity = cart_product.quantity + quantity.to_i
	    cart_product.save
	  else
	    # product does not exist in cart
	    cart_products << CartProduct.new(product_id: product_id, quantity: quantity)
	  end
	end

	def delete_product(product_id)
		cart_products.delete(CartProduct.find_by(product_id: product_id))
	end

	def cart_quantity
		total = 0
		cart_products.each do |cart_product|
			total += cart_product.quantity
		end
		total
	end

	def cart_total
		total = 0
		cart_products.each do |cart_product|
			total += cart_product.quantity * Product.find(cart_product.product_id).price
		end
		total
	end


end
