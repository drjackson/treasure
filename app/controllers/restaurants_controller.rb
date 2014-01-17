class RestaurantsController < ApplicationController
	def index
		@restaurants = REDIS.hgetall('restaurants').values.map{|r| Marshal::load(r)}.sample(2)
	end

	def create
		restaurant = Restaurant.new(params[:restaurant])
    #this will be a problem when we start deleting restaurants...I'll find a better
    #way to do it
		next_index = (REDIS.hlen 'restaurants') + 1
    REDIS.hmset 'restaurants', "restaurant_#{next_index}", Marshal::dump(restaurant)
    render 'new'
	end

   def new
    @restaurant = Restaurant.new
  end

	def show
		id = params[:id]
		@restaurant = Marshal::load(REDIS.hmget('restaurants', "restaurant_#{id}").first)
	end

	def random
		random_index = rand(REDIS.hlen 'restaurants') + 1
		restaurant = Marshal::load(REDIS.hmget('restaurants', "restaurant_#{random_index}").first)

		respond_to do |format|
			format.json { render :json => restaurant}
		end
	end
end
