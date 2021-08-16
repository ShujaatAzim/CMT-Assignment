Rails.application.routes.draw do
  root to: "providers#index"
  resources :providers
  post "/search", to: "providers#search"
end
