Rails.application.routes.draw do
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
    # resources :projects do
    #   collection do
    #     get 'assign'
    #     post 'assign', to: 'projects#assign_user'
    #   end
    # end
      #Ex:- :default =>''
   end
  resources :courses
  get 'articles/allshow'
  # get 'courses/allshow'
  # get 'courses/new'

end
