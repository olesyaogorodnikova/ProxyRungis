Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :packages do
    resources :cart_items, only: :create
  end

  resources :cart_items, only: :destroy

  resources :orders, only: [:create, :show, :index, :edit] do
    resources :payments, only: [:new, :create]
      resources :restaurants
  end

end
