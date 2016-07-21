Rails.application.routes.draw do
  root 'pages#stuk_to_do_home'

  resources :stuk_books

  post '/buy/:slug', to: 'estuk_transactions#create', as: :buy
  get '/pickup/:guid', to: 'estuk_transactions#pickup', as: :pickup

  resources :stuk_todo_tasks do
    member do
      put :change
    end
  end

  get 'estuk_dashboard' => 'pages#estuk_dashboard'

  devise_for :users
  get 'pages/stuk_to_do_home', path: 'stuk_to_do', as: 'stuk_to_do'
  get 'pages/estuk_home', path: 'estuk', as: 'estuk'
  get 'pages/stuk_starter_home', path: 'stuk_starter', as: 'stuk_starter'
end
