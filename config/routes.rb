Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    post '/mutant', to: 'mutant#ismutant'
    get '/stats', to: 'mutant#stats'
    resources :dna_sequences
  end

  
end
