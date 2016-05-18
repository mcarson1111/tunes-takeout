require 'yelp'


#A plain Ruby object that receives and models data retrieved from the Yelp Search API. Wraps interactions with the Yelp Search API by leveraging the Yelp-Ruby gem.

class Restaurant

  CLIENT = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
                            consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                            token: ENV["YELP_TOKEN"],
                            token_secret: ENV["YELP_TOKEN_SECRET"]
                          })


BASE_URL = "https://api.yelp.com/v2/"
attr_reader :business_id, :name, :url, :image_url, :phone, :rating


def initialize(data)
    @business_id = data.business.id
    @name = data.business.name
    @url = data.business.url
    @image_url = data.business.image_url
    @phone = data.business.phone
    @rating = data.business.rating
end

def self.find(id)
  data = CLIENT.business(id)

  self.new(data)
end


end
