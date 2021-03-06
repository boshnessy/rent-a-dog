Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get '/dogs' => 'dogs#index'
  get '/dogs/:id' => 'dogs#show'
  post '/dogs' => 'dogs#create'
  patch '/dogs/:id' => 'dogs#update'
  delete '/dogs/:id' => 'dogs#destroy'
  get '/users/:id' => 'users#show'
  post '/users/' => 'users#create'
  get '/reviews' => 'reviews#index'
  post '/reviews' => 'reviews#create'
  get '/rentals' => 'rentals#index'
  get '/rentals/:id' => 'rentals#show'
  post '/rentals' => 'rentals#create'
  patch '/rentals/:id' => 'rentals#update'
  delete '/rentals/:id' => 'rentals#destroy'
end
