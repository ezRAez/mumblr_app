Rails.application.routes.draw do
  root "mumbles#index"

  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :mumbles, only: [:index, :create]
  end

  resource  :session, only: [:new, :create, :destroy]

  resources :mumbles, only: [:index, :show, :destroy]
end
