Rails.application.routes.draw do

  get '/macbookpro' => 'products#macbook'
  get '/all' => 'products#products'
  
end
