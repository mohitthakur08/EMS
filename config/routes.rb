Rails.application.routes.draw do
  get '/users/index', to: "users#index"
  get '/users/show' ,to: "users#show"
  devise_for :users,controllers: { confirmations: 'confirmations' }
  # delete '/users/sign_out', to: "home#destroy"
  root to: "home#index"
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
