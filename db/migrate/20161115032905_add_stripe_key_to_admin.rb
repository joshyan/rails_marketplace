class AddStripeKeyToAdmin < ActiveRecord::Migration
  def change
  	add_column :admins, :stripe_publishable_key, :string
  	add_column :admins, :stripe_secret_key, :string
  end
end
