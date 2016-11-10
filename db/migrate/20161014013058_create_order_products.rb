class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
    	t.belongs_to :product, :index => true
      	t.belongs_to :order, :index => true
        t.belongs_to :seller, :index => true
      	t.integer :quantity
      	t.string :price

      t.timestamps null: false
    end
  end
end
