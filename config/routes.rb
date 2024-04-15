Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :patients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "patients#index"
end
