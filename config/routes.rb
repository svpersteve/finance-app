Rails.application.routes.draw do
  root to: 'pages#home'
  resources :balances
end
