Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/users', to: 'users#index', as: 'users'
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }

  # devise_scope  :user do
  #   get 'users/sign_out' => 'devise/sessions#destroy'
  # end
  resources :users do
    resources :groups do
     resources :budgets
    end
  end
end
