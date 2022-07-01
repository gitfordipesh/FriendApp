Rails.application.routes.draw do
  devise_for :admins
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  # get '/users', to: 'users#index'
  get '/fi', to: 'users#first'
  # get "/users/:id", to: "users#show",as: :user

# get '/users/',to:'users#show'
  resources :users do
    resources :articles
    resources :courses do
      collection do
        get 'assign'
        post 'assign', to: 'users#assign_course'
      end 
    end
   end
  resources :courses
  get 'articles/allshow'

  resources :projects do
    get 'assign'
    post 'assign', to: 'projects#assign_user'
    delete 'deassign', to: 'projects#deassign_user'
  end
end
