Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :packages do
    resources :cart_items, only: :create
  end
  resources :orders, only: [:show] do
    resources :payments, only: [:new, :create]

  end

end
