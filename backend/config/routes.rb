Rails.application.routes.draw do
  resources :users do
    resources :beers
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/authenticate', to: 'auth#create'
  get '/profile', to: 'auth#profile'
  post '/profile', to: 'auth#profile'
  

end
