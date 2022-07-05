Rails.application.routes.draw do
  get 'status/new'
  get 'status/update'
  get 'projects/new'
  get '/users/index', to: "users#index"
  get '/users/show' ,to: "users#show"
  get  'employees',  to: 'users#new'
  post 'users/add_new_user',  to: 'users#add_new_user'
  get 'users/add_new_user', to: 'users#create'
  get 'leave/new'
  post 'leave/new'
  devise_for :users
  # delete '/users/sign_out', to: "home#destroy"
  root to: "home#index"
  resources :statuses
  resources :projects
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
