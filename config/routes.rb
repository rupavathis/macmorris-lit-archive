Rails.application.routes.draw do
  resources :birth_death_date_types
  resources :genders
  resources :religious_orders
  resources :religious_subtypes
  resources :religious_designations
  resources :languages
  resources :attribs
  resources :roles
  resources :relationship_types
  resources :relationship_categories
  mount RailsAdmin::Engine => '/admin_panel', as: 'rails_admin'
  resources :test_models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
