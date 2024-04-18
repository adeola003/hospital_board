Rails.application.routes.draw do
  get 'search_patients', to: 'patients#search_patients'
  devise_for :users
  root 'pages#home'
  resources :patients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "patients#index"
end
