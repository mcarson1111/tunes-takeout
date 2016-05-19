require 'TunesTakeoutWrapper'
require 'Food'
require 'Music'


class SuggestionsController < ApplicationController

  def index
  #  @pairing = params["pairing"]
  #  @food_item = params["food_item"]
  #  @song = params["song"]
    #shows form to search by keyword
    #shows top 20 suggestions, ranked by total number of favorites
    #instances of the items found
  end

  def create
    #raise make sure the form is working first
    #if params["pairing_query"].present?
    params["pairing_query"] = params["food_pairing_query"]

    params["pairing"] = TunesTakeoutWrapper.find(params["pairing_query"])

    params["food_item"] = Restaurant.find(params["pairing"].food_id)

    params["song"] = Music.find(params["pairing"].music_type,params["pairing"].music_id)  #music_type


    render :index


  end


  def favorites
    #shows all suggestions favorited by the signed-in User
  end

  def favorite
    #adds a suggestion into the favorite list for the signed-in User. This requires interaction with the Tunes & Takeout API.
  end

  def unfavorite
    #removes a suggestion from the favorite list for the signed-in User. This requires interaction with the Tunes & Takeout API.
  end
end
