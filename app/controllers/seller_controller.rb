class SellerController < ApplicationController
	layout 'seller_central'
	include SellerHelper

	before_action :require_login, :except => [:login_form, :login, :signup_form, :signup]
	before_action :set_current_seller
	before_action :set_current_product, :only => [:edit_product, :update_product, :delete_product]

	def login_form
		if seller_logged_in?
			redirect_to seller_dashboard_path
		end
	end

	def login
	    seller = Seller.find_by(email: params[:seller][:email].downcase)
	    if seller && seller.authenticate(params[:seller][:password])
	      seller_log_in seller
	      redirect_to seller_dashboard_path
	    else
	      flash[:error] = 'Invalid email/password combination'
	      render 'login_form'
	    end
	end

	def signup_form
		@seller = Seller.new
	end

	def signup
		@seller = Seller.new(seller_params)
		if @seller.save
			seller_log_in @seller
			redirect_to seller_dashboard_path
		else
	      	render 'signup_form'
	    end
	end

	def logout
		seller_log_out
		redirect_to seller_login_path
	end

	def dashboard

	end

	def products
		@products = Product.where(seller: @current_seller)
	end

	def add_product
		@product = Product.new
	end

	def create_product
		@product = Product.new(product_params)
		@product.seller = @current_seller
		if @product.save
			flash[:notice] = 'New product was successfully added!'
			redirect_to seller_products_path
		else
	      	render 'add_product'
	    end
	end

	def edit_product

	end

	def update_product
		if @product.update_attributes(product_params)
			flash[:notice] = 'Product was successfully updated!'
			redirect_to seller_products_path
		else
	      	render 'update_product'
	    end		
	end

	def delete_product
		@product.destroy
		redirect_to seller_products_path
	end

	def add_bulk_products
		
	end

	def orders
		
	end

	def settings_form

	end

	def settings
		@current_seller.update_attributes(seller_params)
		redirect_to seller_dashboard_path
	end

	  private

		def seller_params
		  params.require(:seller).permit(:seller_name, :email, :password,
		                               :password_confirmation)
		end

	  	def set_current_seller
	    	return unless session[:seller_id]
	    	@current_seller ||= Seller.find(session[:seller_id])
	  	end

		def require_login
		    unless seller_logged_in?
		      flash[:error] = "You must be logged in to access this section"
		      redirect_to seller_login_path # halts request cycle
		    end
		end

		def product_params
		    params.require(:product).permit(:title, :description, :price, :quantity, {images: []}, {files: []}, {category_ids: []})
		end

		def set_current_product
			return unless params[:id]
			@product ||= Product.find(params[:id])
		end
end
