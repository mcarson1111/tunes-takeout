require 'TunesTakeoutWrapper'


class FavoritesController < ApplicationController

  def create
    status_code = TunesTakeoutWrapper.add_favorite(session[:user_id], params["suggestion_id"]) #session["user_id"]

    if status_code == 201
      @message = "Favorite sucessfully added!"
    else
      @message = "Sorry, we were unable to save your favorite at this time."
    end

    @status_code = status_code

    render :success_huh
  end

end
