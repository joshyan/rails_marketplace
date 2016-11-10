class ChangeDataTypeImagesFiles < ActiveRecord::Migration
  def change
  	change_column :products, :images, :text
  	change_column :products, :files, :text
  end
end
