# REDIS_CONFIG = YAML::load_file(Rails.root.join('config', 'redis.yml'))

REDIS = Redis.new(:host => 'treasure-redis.j4clqn.0001.usw2.cache.amazonaws.com', :port => 6379)