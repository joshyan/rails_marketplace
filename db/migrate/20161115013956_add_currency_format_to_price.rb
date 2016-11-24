class AddCurrencyFormatToPrice < ActiveRecord::Migration
  def change
  	change_column :products, :price, :decimal, :precision => 8, :scale => 2
  	remove_column :cart_products, :price
  end
end
