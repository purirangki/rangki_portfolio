Rails.application.routes.draw do
  root 'pages#stuk_to_do_home'

  resources :stuk_books
  resources :stuk_todo_tasks do
    member do
      put :change
    end
  end

  get 'estuk_dashboard' => 'pages#estuk_dashboard'

  devise_for :users
  get 'pages/stuk_to_do_home', path: 'stuk_to_do', as: 'stuk_to_do'
  get 'pages/estuk_home', path: 'estuk', as: 'estuk'
end
