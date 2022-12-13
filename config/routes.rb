Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users do
    resources :foods, only: %i[index new create]
    resources :recipes, only: %i[index show new create destroy] do
      resources :recipe_foods, only: %i[new create destroy]
    end
  end
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index show new create edit update destroy]

  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods, only: %i[new create destroy update edit]
  end
end
