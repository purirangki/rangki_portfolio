Rails.application.routes.draw do
  resources :stuk_todo_tasks do
    member do
      put :change
    end
  end
  root 'pages#home'

  devise_for :users
  get 'pages/home'
  get 'pages/about'
end
