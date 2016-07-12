Rails.application.routes.draw do

  get 'users/login'
  get 'users/validate_login'
  post 'users/validate_login'
  get 'users/logout'

  get 'users/claim_page'
  post 'users/get_claim'
  get 'users/edit_claim'
  patch 'users/update_claim'
  get 'users/delete_claim'

  get 'users/user_index'
  post 'users/user_index'

  get 'users/claim_history'
  post 'users/claim_history'

  get 'users/user_status'
  post 'users/user_status'
  
  get 'users/claim_index_financier'
  post 'users/claim_index_financier'

  get 'users/approve_claim'
  post 'users/approve_claim'

  get 'users/single_user_index'
  post 'users/single_user_index'

  get 'users/show_image'
  post 'users/show_image'

  get 'users/add_debit'
  post 'users/add_debit'
  
  get 'users/get_debit'
  post 'users/get_debit'
 
  get 'users/debit_history'
  post 'users/debit_history'
 
  get 'users/debit_edit'
  post'users/debit_edit'
  patch 'users/debit_update'

  get 'users/add_expense_category'
  post 'users/add_expense_category'

  get 'users/get_expense_category'
  post 'users/get_expense_category'
  
  get 'users/add_bank'
  post 'users/add_bank'

  get 'users/get_bank'
  post 'users/get_bank'
  

  resources :users
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'users#login'

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
