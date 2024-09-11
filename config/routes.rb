Rails.application.routes.draw do
  namespace :api do
    resources :tickets, only: [:create]
  end

  resources :tickets, only: [:index, :show]
end
