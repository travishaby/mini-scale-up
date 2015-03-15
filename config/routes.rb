Rails.application.routes.draw do
  get "/menu", to: "items#index"

  resources :orders, only: [:create]
  get "/order", to: "orders#show"
  resources :categories do
    resources :items
  end

  get "login" => "sessions#new", :as => "login"
  post "login" => "sessions#create"
  resources :users, only: [:show]
  resources :items

  namespace 'admin' do
    get '', to: 'dashboard#index', as: '/'
  end

end
