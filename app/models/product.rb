class Product < ActiveRecord::Base
	include FriendlyId
	friendly_id :title, :use => :slugged

	has_many :category_products, :dependent => :destroy, :autosave => true , :inverse_of => :product
	accepts_nested_attributes_for :category_products, :allow_destroy => true, :reject_if => :all_blank
	has_many :categories, :through => :category_products

	belongs_to :seller
	
	has_many :order_products
	has_many :orders, :through => :order_products

	serialize :images, JSON
	serialize :files, JSON
	mount_uploaders :images, ProductImagesUploader
	mount_uploaders :files, ProductFilesUploader

	validates :title, :presence => true
	validates :images, :presence => true
	validates :price, :presence => true
	validates :quantity, :presence => true
	validates :files, :presence => true

	def should_generate_new_friendly_id?
	  title_changed?
	end
end
