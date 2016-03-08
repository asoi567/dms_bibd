Rails.application.routes.draw do
  namespace :dmsf do
    resources :document_definitions
  end
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
