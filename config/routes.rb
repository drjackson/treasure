Treasure::Application.routes.draw do
  root :to => 'restaurants#index'

  resources :restaurants, :only => [:index, :show, :create, :new]

  get 'restaurants/random' => 'restaurantss#random', :as => :random_restaurant
end
