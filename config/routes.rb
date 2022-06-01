Rails.application.routes.draw do
  resources :subtasks
  resources :tasks
  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
end
