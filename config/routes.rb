Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :movies
      namespace :movies do
        resources :ratings, only: [:create, :update, :destroy]
        resources :user_movies, only: [:index, :create, :update, :destroy]
      end
      resources :genres
    end
  end
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }, path_prefix: "api/:version"
end
