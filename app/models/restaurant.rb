class Restaurant
  # attr_accessible :address, :name, :url
  attr_reader :address, :name, :url

  def initialize(hash = {})
  	@name = hash[:name]
  	@address = hash[:address]
  	@url = hash[:url]
  end
end
