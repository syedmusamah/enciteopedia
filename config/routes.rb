Enciteopedia::Application.routes.draw do
resources 'veditors'
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
   get "editors/index"
   get "editors/new"
   get "editors/create"
   get "editors/update"
   get "home/top"
   get "editors/destroy"
   get "veditors/show"
   get "veditors/index"
   get "veditors/new"
  post "veditors/approve"


get "veditors/like"
get "veditors/unlike"
   get "veditors/create"
   get "veditors/update"
   get "veditors/destroy"
   get "veditors/show"
   get "misc/policy"
   get "misc/community"
   get "home/homepage"
   get "home/articles"
   get "home/index"
   get "home/show"
   get "home/new"
   get "home/policy"
   get "home/community"
   get "articles/artlist"
   get "articles/index"
   get "articles/new"
   get "articles/show"
get "articles/update"
get "articles/destroy"
get "articles/create"

resources 'home'  do
member do
	get 'top'
end
end
resources 'articles'
resources 'veditors'do
 member do
	get 'like'
	get 'unlike'
	get 'approve'
end
end
resources :editors do
 member do
	get 'like'
	get 'unlike'
end
end
resources 'sessions'

  match '/signup',:to => 'users#index'
  match '/signin',:to => 'sessions#new'
  match '/signout',:to => 'sessions#destroy'




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
