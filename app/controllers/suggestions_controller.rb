require 'TunesTakeoutWrapper'
require 'Food'
require 'Music'


class SuggestionsController < ApplicationController

  def index
    #shows form to search by keyword
    #shows top 20 suggestions, ranked by total number of favorites
  end

  def create
    #raise make sure the form is working first
    pairing_query = params["food_pairing_query"]

    pairing = TunesTakeoutWrapper.find(pairing_query)

    food_item = Restaurant.find(pairing.food_id)

    song = Music.find(pairing.music_id)

    redirect_to suggestions_path

  #take the keyword and go to Charles' API i guess??
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
