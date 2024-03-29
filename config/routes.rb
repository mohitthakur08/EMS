# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'leaves/approve_leave'
  post 'projects/assign_project'
  delete 'projects/unassign_project'
  get 'status/new'
  get 'status/update'
  get 'users/index', to: 'users#index'
  get 'users/show', to: 'users#show'
  get 'employees', to: 'users#new'
  get 'users/new_employee'
  post 'users/create_employee', to: 'users#create_employee'
  devise_for :users
  # delete '/users/sign_out', to: "home#destroy"
  root to: 'home#index'
  resources :statuses do
    member do
      get 'statuses/daily_task'
    end
  end
  resources :projects
  resources :leaves do
    member do
      get 'leaves/approve_leave'
      get 'leaves/reject_leave'
    end
  end

  namespace :api do 
    namespace :v1 do 
      resources :users
      resources :statuses
      resources :projects
      resources :leaves
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
