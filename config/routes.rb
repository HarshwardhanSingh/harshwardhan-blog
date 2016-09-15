Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  root to: "sessions#new"
end
