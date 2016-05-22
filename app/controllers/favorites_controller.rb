require 'TunesTakeoutWrapper'


class FavoritesController < ApplicationController

  def create
    status_code = TunesTakeoutWrapper.add_favorite(session[:user_id], @pairing.id)

    if status_code == 201
      @message = "Favorite sucessfully added!"
    elsif status_code == 409
      @message = "You've already favorited this pairing."
    else
      @message = "Sorry, we were unable to save your favorite at this time."
    end

    @status_code = status_code

    render :favorite_success_huh
  end


  def destroy
    status_code = TunesTakeoutWrapper.unfavorite(session[:user_id], @pairing.id)
    if status_code == 204
      @message = "You've unfavorited this pairing."
    elsif status_code == 404
      @message = "This pairing wasn't one of your favorites."
    elsif status_code == 400
      @message = "Sorry, we could not unfavorite this pairing at this time."
    end

    @status_code = status_code

    render :unfavorite_success_huh

  end

  def your_favorites
    @favorites = TunesTakeoutWrapper.your_favorites(session[:user_id])




  end
end
