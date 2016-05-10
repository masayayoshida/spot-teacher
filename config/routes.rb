Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'sessions/new'
  get 'login' , to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  delete 'lessontimes/cancel', to: 'lessontimes#destroy'
  
  resources :lessontimes
  resources :lessons
  resources :schools
  resources :sessions, only:[:new, :create, :destroy]
end
