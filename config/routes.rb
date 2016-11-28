Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'home' => 'home#index'

  namespace :api do
    namespace :v1 do
      post 'auth_user' => 'authentication#authenticate_user'
      post 'register_user' => 'authentication#register_user'
      get 'products' => 'product#index'
      post 'product' => 'product#create'
      get 'category' => 'category#show'
      post 'add_to_cart' => 'shopping_cart#add_to_cart'
      get 'user' => 'user#show'
    end
  end

  
end
