Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # resources :posts do
  #   resources :votes, only: [:post]
  # end

  # resources :comments do
  #   resources :votes, only: [:comment]
  # end

  root to: "posts#index"
  get "posts/new", to: "posts#new", as: "posts_new"
  post "posts", to: "posts#create"

  get "posts/:id/show", to: "posts#show", as: "posts_show"
  put "posts/:id", to: "posts#update", as: "post"
  get "posts/:id/edit", to: "posts#edit", as: "posts_edit"
  delete "posts/:id", to: "posts#destroy", as: "posts_delete"

  post "posts/:id", to: "comments#create", as: "post_comment"
  get "posts/:id/show/:comment_id/edit", to: "comments#edit", as: "edit_comment"
  patch "posts/:id/show/:comment_id/edit", to: "comments#update", as: "update_comment"
  delete "posts/:id/show/:comment_id", to: "comments#destroy", as: "delete_comment"

  get "signups/new", to: "registrations#new", as: "new_signup"
  post "signups", to: "registrations#create", as: "signups"

  get "login", to: "logins#new", as: "login"
  post "login", to: "logins#create"
  delete "login", to: "logins#destroy"

  # post "posts/:id/show/:comment_id/vote", to: "votes#comment"
  post "posts/:id/vote", to: "votes#create", as: "vote"



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
