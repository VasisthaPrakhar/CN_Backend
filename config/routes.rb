Rails.application.routes.draw do
  resources :user_roles
  resources :user_regs
  devise_for :user1s
  root "articles#index"
  resources :tags
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :articles
  namespace :api do
    namespace :v1 do
      resources :articles
      resources :tags
      resources :taggables
      resources :user_regs
      resources :reggables
    end
  end

    resources :user2s
    post '/auth/login', to: 'authentication#login'
    post '/auth/decode', to: 'authentication#de_code'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
