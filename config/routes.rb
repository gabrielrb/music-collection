Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists, only: :index do
    resources :albums, only: [:index, :edit, :update, :destroy]
  end

  resources :albums, only: [:new, :create]

end
