Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

  get 'sellercentral' => 'seller#login_form', as: :seller_login
  post 'sellercentral' => 'seller#login'
  get 'sellercentral/signup' => 'seller#signup_form', as: :seller_signup
  post 'sellercentral/signup' => 'seller#signup'
  get 'sellercentral/logout' => 'seller#logout', as: :seller_logout
  get 'sellercentral/dashboard' => 'seller#dashboard', as: :seller_dashboard
  get 'sellercentral/products' => 'seller#products', as: :seller_products
  get 'sellercentral/add_product' => 'seller#add_product', as: :seller_add_product
  post 'sellercentral/create_product' => 'seller#create_product', as: :seller_create_product
  get 'sellercentral/edit_product' => 'seller#edit_product', as: :seller_edit_product
  post 'sellercentral/update_product' => 'seller#update_product', as: :seller_update_product
  get 'sellercentral/delete_product' => 'seller#delete_product', as: :seller_delete_product
  get 'sellercentral/add_bulk_products' => 'seller#add_bulk_products', as: :seller_add_bulk_products
  get 'sellercentral/orders' => 'seller#orders', as: :seller_orders

  get 'superadmin' => 'admin#login_form', as: :admin_login
  post 'superadmin' => 'admin#login'
  get 'superadmin/signup' => 'admin#signup_form', as: :admin_signup
  post 'superadmin/signup' => 'admin#signup'
  get 'superadmin/logout' => 'admin#logout', as: :admin_logout
  get 'superadmin/dashboard' => 'admin#dashboard', as: :admin_dashboard
  get 'superadmin/sellers' => 'admin#sellers', as: :admin_sellers
  get 'superadmin/seller/:id/products' => 'admin#seller_products', as: :admin_seller_products  
  get 'superadmin/categories' => 'admin#categories', as: :admin_categories
  get 'superadmin/add_category' => 'admin#add_category', as: :admin_add_category
  post 'superadmin/create_category' => 'admin#create_category', as: :admin_create_category
  get 'superadmin/edit_category' => 'admin#edit_category', as: :admin_edit_category
  post 'superadmin/update_category' => 'admin#update_category', as: :admin_update_category
  get 'superadmin/products' => 'admin#products', as: :admin_products
  get 'superadmin/category/:id/products' => 'admin#category_products', as: :admin_category_products


  get 'catalog/:name' => 'catalog#category_products', as: :category_products
  get 'product/:title' => 'catalog#product_detail', as: :product_detail

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
