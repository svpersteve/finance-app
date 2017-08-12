Rails.application.routes.draw do
  root to: 'pages#home'
  resources :accounts
  resources :balances
  get '/current-month', to: 'pages#current_month', as: 'current_month'
  get '/current-year', to: 'pages#current_year', as: 'current_year'
end
