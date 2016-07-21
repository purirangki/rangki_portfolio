Rails.application.routes.draw do
  resources :stuk_books
  root 'pages#stuk_to_do_home'

  resources :stuk_todo_tasks do
    member do
      put :change
    end
  end

  devise_for :users
  get 'pages/stuk_to_do_home', path: 'stuk_to_do', as: 'stuk_to_do'
  get 'pages/estuk_home', path: 'estuk', as: 'estuk'
end
