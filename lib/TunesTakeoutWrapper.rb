#this is like the pokemon thing he made yesterday.... but he made it in his models

require 'httparty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"
  attr_reader :id, :food_id, :music_id, :music_type

  def initialize(data)
    @id = data["suggestions"][0]["id"]
    @food_id = data["suggestions"][0]["food_id"]
    @music_id = data["suggestions"][0]["music_id"]
    @music_type = data["suggestions"][0]["music_type"]
  end

  def self.find(item)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{item}&limit=1").parsed_response
    self.new(data)
  end

end
