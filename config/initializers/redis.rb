if Rails.env.development?
  REDIS = Redis.new
else
  REDIS = Redis.new(:host => 'treasure-redis.j4clqn.0001.usw2.cache.amazonaws.com', :port => 6379)
end