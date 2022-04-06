Rails.application.routes.draw do
  resources :dna_sequences
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/mutant', to: 'mutant#ismutant'
  get '/stats', to: 'mutant#stats'
end
