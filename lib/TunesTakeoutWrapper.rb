#this is like the pokemon thing he made yesterday.... but he made it in his models

require 'httparty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"
  attr_reader :id, :food_id, :music_id, :music_type

  def initialize(data)
      @id = data["suggestion"]["id"]
      @food_id = data["suggestion"]["food_id"]
      @music_id = data["suggestion"]["music_id"]
      @music_type = data["suggestion"]["music_type"]

  end


  def self.find(item)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{item}&limit=1/").parsed_response
    data["suggestion"] = data.delete("suggestions")
    data["suggestion"] = data["suggestion"][0]

    if data["suggestion"].nil?
     return @message = "Sorry, we couldn't find a good suggestion."
   end

    self.new(data)
  end



  def self.add_favorite(user_id, suggestion_id)
    body_data = {"suggestion": suggestion_id}.to_json
    response = HTTParty.post(BASE_URL + "/v1/users/#{user_id}/favorites", body: body_data)
    return response.code
  end



  def self.unfavorite(user_id, suggestion_id)
    body_data = {"suggestion": suggestion_id}.to_json
    response = HTTParty.delete(BASE_URL + "/v1/users/#{user_id}/favorites", body: body_data)
    return response.code
  end



  def self.your_favorites(user_id)
    data = HTTParty.get(BASE_URL + "/v1/users/#{user_id}/favorites").parsed_response

    pairings = []
    data["suggestions"].each do |suggestion|
      pairings << HTTParty.get(BASE_URL + "/v1/suggestions/#{suggestion}").parsed_response
    end

    instances = []
    pairings.each do |pairing|
      instances << self.new(pairing)
    end

    return instances
  end



  def self.top
    data = HTTParty.get(BASE_URL + "/v1/suggestions/top").parsed_response

    suggestion_pairings = []
    data["suggestions"].each do |suggestion|
      suggestion_pairings << HTTParty.get(BASE_URL + "/v1/suggestions/#{suggestion}").parsed_response
    end

    suggestion_instances = []
    suggestion_pairings.each do |pairing|
      suggestion_instances << self.new(pairing)
    end

    return suggestion_instances

  end


end
