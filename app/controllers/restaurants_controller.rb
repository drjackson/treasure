class RestaurantsController < ApplicationController
	def index
		@restaurants = REDIS.hgetall('restaurants').values.map{|r| Marshal::load(r)}
	end

	def create
		restaurant = Restaurant.new(params[:restaurant])
		index = (REDIS.hlen 'restaurants') + 1
    REDIS.hmset 'restaurants', "restaurant_#{index}", Marshal::dump(restaurant)
	end

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
end
