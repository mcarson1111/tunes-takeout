class FavoritesController < ApplicationController

  def create
    status_code = TunesTakeoutWrapper.add_favorite(1, params["suggestion_id"]) #session["user_id"]

    if status_code == 201
      @message = "Favorite sucessfully added!"
    else
      @message = "Sorry, we were unable to save your favorite at this time."
    end

    render :success_huh
  end

end
