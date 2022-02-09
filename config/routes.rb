Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources 'subjects', only: %i(create destroy)
  resources 'conjunctions', only: %i(create destroy)
  resources 'predicates', only: %i(create destroy)
end
