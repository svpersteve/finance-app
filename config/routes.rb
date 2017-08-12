Rails.application.routes.draw do
  root to: 'pages#home'
  resources :accounts
  resources :balances
  get '/current-month', to: 'pages#current_month', as: 'current_month'
  get '/current-year', to: 'pages#current_year', as: 'current_year'
  get '/current-month-graph', to: 'pages#current_month_graph', as: 'current_month_graph'
  get '/current-year-graph', to: 'pages#current_year_graph', as: 'current_year_graph'
end
