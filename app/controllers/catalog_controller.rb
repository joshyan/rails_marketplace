class CatalogController < ApplicationController

	before_action :set_current_category, :only => [:category_products, :product_detail]
	before_action :set_current_cart, :only => [:add_to_cart, :cart, :cart_update, :cart_delete, :checkout, :charge, :checkout_success]

	def index

	end
	
	def category_products
		@products = @category.products
	end

	def product_detail
		@product = Product.friendly.find(params[:title])
	end

	def add_to_cart
		@cart.add_product params[:product_id], params[:quantity]
		redirect_to cart_url
	end

	def cart
		@cart_quantity = @cart.cart_quantity
		@cart_total = @cart.cart_total
	end

	def cart_update
		@cart.update_product params[:product_id], params[:quantity]
	end

	def cart_delete
		@cart.delete_product params[:product_id]
		redirect_to cart_url
	end

	def checkout
		@total = @cart.cart_total
		@amount = @cart.cart_total.cents
	end

	def charge
	  	# Amount in cents
	  	@amount = @cart.cart_total.cents

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Create a charge: this will charge the user's card
		begin
		  charge = Stripe::Charge.create(
		    :amount => @amount, # Amount in cents
		    :currency => "usd",
		    :source => token,
		    :description => "Example charge"
		  )
		rescue Stripe::CardError => e
		  # The card has been declined
		  flash[:error] = e.message
	  	  redirect_to checkout_path
		end

		# todo: save order, send email
		redirect_to checkout_success_path
	end

	def checkout_success
		
	end


	private
		def set_current_category
			if params[:name]
				session[:current_category_name] = params[:name]
			end
			return unless session[:current_category_name]
			@category ||= Category.friendly.find(session[:current_category_name])
		end

		def set_current_cart
	    	@cart ||= Cart.find(session[:cart_id])

	    rescue ActiveRecord::RecordNotFound
	        @cart = Cart.create
	        session[:cart_id] = @cart.id
		end
		
end
