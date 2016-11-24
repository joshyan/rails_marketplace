class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
    	t.belongs_to :product, :index => true
      	t.belongs_to :cart, :index => true
      	t.integer :quantity
      	t.string :price

      t.timestamps null: false
    end
  end
end
