# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  namespace :dashboard do
    resources :dummies
  end
  namespace :dashboard do
  get 'home/index'
  resources :marital_statuses
  resources :contacts
  resources :lawsuits
  resources :phones
  resources :forums
  resources :lawyers
  resources :professions
  end

  get 'dashboard', to: 'dashboard/home#index'
  get 'home', to: 'site/home#index'
  get 'history', to: 'site/history#index'
  get 'services', to: 'site/services#index'
  get 'contact', to: 'site/contact#index'

  
  
 
  namespace :site do
    get 'home/index'
  end

  root 'site/home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
