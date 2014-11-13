Rails.application.routes.draw do
  resources :query, only: [:index]
end
