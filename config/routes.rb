Rails.application.routes.draw do
  root 'pages#stuk_to_do_home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'pages/stuk_todo_home', path: 'stuk_todo', as: 'stuk_todo'
  get 'pages/estuk_home', path: 'estuk', as: 'estuk'
  get 'pages/stuk_starter_home', path: 'stuk_starter', as: 'stuk_starter'
  get 'pages/stuk_places_home', path: 'stuk_places', as: 'stuk_places'

  resources :stuk_todo_tasks do
    member do
      put :change
    end
  end

  resources :stuk_books
  get 'estuk_dashboard' => 'pages#estuk_dashboard'
  post '/buy/:slug', to: 'estuk_transactions#create', as: :buy
  get '/pickup/:guid', to: 'estuk_transactions#pickup', as: :pickup
  
  resources :stuk_starter_projects do
    resources :stuk_starter_rewards, only: [:new, :create, :edit, :update, :destroy]
    resources :stuk_starter_pledges
    resources :stuk_starter_payments, only: [:new, :create]
  end

  match '/delayed_job' => DelayedJobWeb, anchor: false, via: [:get, :post]
end
