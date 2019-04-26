Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_ingredients
      resources :ingredients
      resources :recipes
      resources :users
      post '/login', to: 'auth#login'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
