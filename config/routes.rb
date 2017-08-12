Rails.application.routes.draw do
  root to: 'pages#home'
  resources :accounts
  resources :balances
end
