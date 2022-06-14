Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  # get '/users', to: 'users#index'
  get '/fi', to: 'users#first'
  # get "/users/:id", to: "users#show",as: :user

# get '/users/',to:'users#show'
  resources :users do
    resources :articles
  end
  

end
