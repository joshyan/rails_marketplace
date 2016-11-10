class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
    	t.string :email
    	t.string :password
        t.string :password_digest
    	t.string :phone_number
    	t.string :first_name
    	t.string :last_name
    	t.string :seller_name
    	t.integer :status, :limit => 1
    	t.string :on_vacation
    	t.string :tax_id

    	t.timestamps null: false
    end
  end
end
