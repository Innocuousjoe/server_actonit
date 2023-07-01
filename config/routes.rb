Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # add routes for a model named tasks and wrap it in a v1 module
  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end
end