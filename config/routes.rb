Rails.application.routes.draw do
  get 'home/index'
  get '/Dashboard',to: "user#Dashboard" 
  devise_for :users
  # delete '/users/sign_out', to: "home#destroy"
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
