Rails.application.routes.draw do

  get '/macbook' => 'products#macbook'
  get '/ipad' => 'products#ipad'
  get '/appletv' => 'products#apple_tv'
  get '/westwing' => 'products#west_wing'
  get '/studio60' => 'products#studio_60'
  get '/newsroom' => 'products#newsroom'
  get '/sportsnight' => 'products#sports_night'
  get '/wwbook' => 'products#ww_book'
  get '/afewgoodmen' => 'products#a_few_good_men'
  get '/jersey' => 'products#rizzo_jersey'
  get '/' => 'products#products'
  
  get '/products' => 'products#index'

  get '/products/new' => 'products#new'
  post 'products' => 'products#create'

  get '/products/:id' => 'products#show'

  get 'products/:id/edit' => 'products#edit'
  patch 'products/:id' => 'products#update'
  
  delete 'products/:id' => 'products#destroy' 
    
end
