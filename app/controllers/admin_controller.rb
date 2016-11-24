class AdminController < ApplicationController
	layout 'super_admin'
	include AdminHelper

	before_action :require_login, :except => [:login_form, :login, :signup_form, :signup]
	before_action :set_current_admin
	before_action :set_current_category, :only => [:edit_category, :update_category, :delete_category]

	def login_form
		if admin_logged_in?
			redirect_to admin_dashboard_path
		end
	end

	def login
	    admin = Admin.find_by(email: params[:admin][:email].downcase)
	    if admin && admin.authenticate(params[:admin][:password])
	      admin_log_in admin
	      redirect_to admin_dashboard_path
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'login_form'
	    end
	end

	def signup_form
		@admin = Admin.new
	end

	def signup
		@admin = Admin.new(admin_params)
		if @admin.save
			admin_log_in @admin
			redirect_to admin_dashboard_path
		else
	      	render 'signup_form'
	    end
	end

	def logout
		admin_log_out
		redirect_to admin_login_path
	end

	def sellers
		@sellers = Seller.all
	end
	
	def seller_products
		seller_id = params[:id]
		seller = Seller.find(seller_id)
		@products = Product.where(seller: seller)
	end

	def categories
		# @categories = Category.all
	end

	def add_category

	end

	def create_category
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = 'New category was successfully added!'
			redirect_to admin_categories_path
		else
	      	render 'add_category'
	    end
	end

	def edit_category

	end

	def update_category
		if @category.update_attributes(category_params)
			flash[:notice] = 'Category was successfully updated!'
			redirect_to admin_categories_path
		else
	      	render 'update_category'
	    end	
	end

	def delete_category
		@category.destroy
		redirect_to admin_categories_path	
	end

	def products
		@products = Product.all
	end

	def category_products
		category_id = params[:id]
		category = Category.friendly.find(category_id)
		@products = category.products
	end

	def settings_form

	end

	def settings
		@current_admin.update_attributes(admin_params)
		redirect_to admin_dashboard_path
	end

	  private

		def admin_params
		  params.require(:admin).permit(:name, :email, :password,
		                               :password_confirmation, :stripe_publishable_key, :stripe_secret_key)
		end

		def category_params
		  params.require(:category).permit(:name, :description, :image, :parent_id)
		end

		def set_current_admin
	    	return unless session[:admin_id]
	    	@current_admin ||= Admin.find(session[:admin_id])
	  	end

	  	def set_current_category
			return unless params[:id]
			@category ||= Category.find(params[:id])
		end

		def require_login
		    unless admin_logged_in?
		      flash[:error] = "You must be logged in to access this section"
		      redirect_to admin_login_path # halts request cycle
		    end
		end
end
