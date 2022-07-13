Rails.application.routes.draw do
  #get 'leaves/approve_leave'
  post 'projects/assign_project'
  delete 'projects/unassign_project'
  get 'status/new'
  get 'status/update'
  get 'users/index', to: "users#index"
  get 'users/show' ,to: "users#show"
  get  'employees',  to: 'users#new'
  # get 'users/add_new_user',  to: 'users#create'
  get 'users/add_new_user', to: 'users#add_new_user' 
  devise_for :users 
  # delete '/users/sign_out', to: "home#destroy"
  root to: "home#index"
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
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
