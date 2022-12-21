Rails.application.routes.draw do
  resources :sites
  resources :work_formats
  resources :work_details
  resources :connections
  resources :time_periods
  resources :source_target_types
  resources :timeperiods
  resources :bardic_poetries
  resources :create_languages_people_join_tables
  resources :create_join_table_people_languages
  resources :add_people_ref_to_languages
  resources :site_types
  resources :works
  resources :authorships
  resources :work_source_libraries
  resources :work_forms
  resources :work_classifications
  resources :places
  resources :place_types
  resources :test_dels
  resources :people
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

  get '/people/:id/works', to: 'people#showWorks'
  get '/names', to: 'people#showNames'
  get '/people/:id/connections', to: 'people#showConnections'
  get '/attribs/roles/:id', to: 'attribs#showRoles'
  get '/search/people', to: 'people#showSearch'
  get '/search/works', to: 'works#showSearch'

  mount RailsAdmin::Engine => '/admin_panel', as: 'rails_admin'
  root to: redirect('/admin_panel', status: 302)
  resources :test_models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
