Rails.application.routes.draw do

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
    
end