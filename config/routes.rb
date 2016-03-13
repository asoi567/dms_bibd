Rails.application.routes.draw do
  namespace :dmsf do
    resources :standard_operations
  end
  root to: 'home#index'

  namespace :dmsf do
    resources :accounts
    resources :analytics
    resources :analytic_types
    resources :document_definitions
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
