Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # User controller routes
  post '/signup', to:'users#create'
  get '/me', to: 'users#show'

  
  # Session controller routes 
  post '/login', to: 'sessions#create'
  get 'logout', to:'sessions#destroy'


end
