Rails.application.routes.draw do

  devise_for :users
  root "products#index"

  get '/' => 'products#products'
  
  get '/products' => 'products#index'

  get '/products/new' => 'products#new'
  post '/products' => 'products#create'

  get '/products/random' => 'products#random'
  get '/products/:id' => 'products#show'

  get '/products/:id/edit' => 'products#edit'
  patch 'products/:id' => 'products#update'
  
  delete '/products/:id' => 'products#destroy' 
  post '/search' => 'products#search'


 
  get '/suppliers' => 'suppliers#index'

  get '/suppliers/new' => 'suppliers#new'
  post '/suppliers' => 'suppliers#create'

  get '/suppliers/random' => 'suppliers#random'
  get '/suppliers/:id' => 'suppliers#show'

  get '/suppliers/:id/edit' => 'suppliers#edit'
  patch 'suppliers/:id' => 'suppliers#update'
  
  delete '/suppliers/:id' => 'suppliers#destroy' 
  post '/search' => 'suppliers#search'


  get '/images' => 'images#index'

  get '/images/new' => 'images#new'
  post '/images' => 'images#create'

  get '/images/random' => 'images#random'
  get '/images/:id' => 'images#show'

  get '/images/:id/edit' => 'images#edit'
  patch 'images/:id' => 'images#update'
  
  delete '/images/:id' => 'images#destroy' 
  post '/search' => 'images#search'
  

  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'

    
end