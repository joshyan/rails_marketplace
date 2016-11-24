class Category < ActiveRecord::Base
	extend ActsAsTree::TreeWalker
	include FriendlyId
	friendly_id :name, :use => :slugged

	has_many :category_products, :dependent => :destroy, :autosave => true , :inverse_of => :category
	accepts_nested_attributes_for :category_products, :allow_destroy => true, :reject_if => :all_blank
	has_many :products, :through => :category_products

	acts_as_tree order: 'parent_id'

	def should_generate_new_friendly_id?
	  name_changed?
	end

	def self.root_categories
		where('parent_id' == nil).order('id asc')
	end
end
