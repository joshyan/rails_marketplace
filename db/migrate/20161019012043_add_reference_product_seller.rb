class AddReferenceProductSeller < ActiveRecord::Migration
  def change
  	add_reference :products, :seller, index: true
  end
end
