require 'TunesTakeoutWrapper'
require 'Food'
require 'Music'


class SuggestionsController < ApplicationController

  def index
    # @pairing = TunesTakeoutWrapper.find(@pairing_query)
    # @food_item = Restaurant.find(@pairing.food_id)
    # @song = Music.find(@pairing.music_type,@pairing.music_id)
    #
    @top20 = TunesTakeoutWrapper.top
    #shows form to search by keyword
    #shows top 20 suggestions, ranked by total number of favorites
    #instances of the items found

  end

  def create
    #raise make sure the form is working first
    #if params["pairing_query"].present?
    #@pairing...better practice, shouldn't store stuffs in the params.

    @pairing_query = params["food_pairing_query"]
    #params["pairing_query"] = params["food_pairing_query"]

    @pairing = TunesTakeoutWrapper.find(@pairing_query)
    #params["pairing"] = TunesTakeoutWrapper.find(params["pairing_query"])

    @food_item = Restaurant.find(@pairing.food_id)
    #params["food_item"] = Restaurant.find(params["pairing"].food_id)

    @song = Music.find(@pairing.music_type,@pairing.music_id)
    #params["song"] = Music.find(params["pairing"].music_type,params["pairing"].music_id)  #music_type

    @top20 = TunesTakeoutWrapper.top

    render :index


  end


  def favorites
    @favorites = TunesTakeoutWrapper.your_favorites(session[:user_id])
  end


  def favorite
    user = User.find(session[:user_id])
    user_id = user.uid
    status_code = TunesTakeoutWrapper.add_favorite(user_id, params["suggestion_id"])
    # status_code = TunesTakeoutWrapper.add_favorite(session[:user_id], params["suggestion_id"])
    
    if status_code == 201
      @message = "Favorite sucessfully added!"
    elsif status_code == 409
      @message = "You've already favorited this pairing."
    else
      @message = "Sorry, we were unable to save your favorite at this time."
    end

    @status_code = status_code

  end


  def unfavorite
    user = User.find(session[:user_id])
    user_id = user.uid
    suggestion_id = params["suggestion_id"]
    status_code = TunesTakeoutWrapper.unfavorite(user_id,suggestion_id)

    # status_code = TunesTakeoutWrapper.unfavorite(session[:user_id], params["suggestion_id"])

    if status_code == 204
      @message = "You've unfavorited this pairing."
    elsif status_code == 404
      @message = "This pairing wasn't one of your favorites."
    elsif status_code == 400
      @message = "Sorry, we could not unfavorite this pairing at this time."
    end

    @status_code = status_code

  end
end
