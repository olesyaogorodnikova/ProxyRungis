Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :packages
  resources :orders, only: [:show] do
    resources :payments, only: [:new, :create]
  end
end
