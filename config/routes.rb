Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin_panel', as: 'rails_admin'
  resources :test_models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
