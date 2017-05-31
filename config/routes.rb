Rails.application.routes.draw do
  root to: 'monitors#index', defaults: { type: 'garden' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :monitors, only: [:create, :index]
end
