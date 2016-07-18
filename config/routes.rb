Rails.application.routes.draw do
  resources :tasks
  root 'pages#home'

  devise_for :users
  get 'pages/home'
  get 'pages/about'
end
