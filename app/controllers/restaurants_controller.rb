class RestaurantsController < ApplicationController
	def index
		@restaurants = REDIS.hgetall 'restaurants'
	end

	def create
		restaurant = Restaurant.new(params[:restaurant])
		index = (REDIS.hlen 'restaurants') + 1
		REDIS.mapped_hmset 'restaurants', {"restaurant_#{index}", Marshal::dump(restaurant)}
	end

	def show
		id = params[:id]
		@restaurant = REDIS.hmget 'restaurants', "restaurant_#{id}"
	end

	def random
		random_index = rand(REDIS.hlen 'restaurants') + 1
		restaurant = REDIS.hmget 'restaurants', "restaurant_#{random_index}"

		respond_to do |format|
			format.json { render :json => restaurant}
		end
	end
end

