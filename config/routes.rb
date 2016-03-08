Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :movies
      resources :genres
    end
  end
  devise_for :users, controllers: { sessions: "users/sessions" }, path_prefix: "api/:version"
end
