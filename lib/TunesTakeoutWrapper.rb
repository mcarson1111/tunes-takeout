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
    data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{item}").parsed_response
    self.new(data)
  end

  def self.add_favorite(user_id, suggestion_id)
    body_data = {"suggestion": suggestion_id}
    response = HTTParty.post(BASE_URL + "/v1/users/#{user_id}/favorites", body: body_data)
    return response.code
  end

end
