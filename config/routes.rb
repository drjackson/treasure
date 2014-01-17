Treasure::Application.routes.draw do
  root :to => 'restaurants#index'

  resources :restaurants, :only => [:index, :show, :create]

  get 'restaurants/random' => 'restaurantss#random', :as => :random_restaurant
end
