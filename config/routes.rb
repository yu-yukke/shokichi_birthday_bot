Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources 'subjects', only: %i(create)
  resources 'conjunctions', only: %i(create)
  resources 'predicates', only: %i(create)
end
