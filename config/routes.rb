Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  get 'pages/about'
end
