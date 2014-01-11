class RestaurantsController < ApplicationController
	def index
		@restaurants = REDIS.hgetall('restaurants').values.map{|r| Marshal::load(r)}
	end
  helper_method :index

	def create
		restaurant = Restaurant.new(params[:restaurant])
		index = (REDIS.hlen 'restaurants') + 1
    REDIS.hmset 'restaurants', "restaurant_#{index}", Marshal::dump(restaurant)
	end
  helper_method :create

	def show
		id = params[:id]
		@restaurant = REDIS.hmget 'restaurants', "restaurant_#{id}"
	end

	def random
		random_index = rand(REDIS.hlen 'restaurants') + 1
		restaurant = REDIS.hmget 'restaurants', "restaurant_#{random_index}"

		respond_to do |format|
			format.json { render :json => Marshal::load(restaurant)}
		end
	end
  helper_method :random
end
