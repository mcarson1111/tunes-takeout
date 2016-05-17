class SessionsController < ApplicationController

  def new
    #shows a view with OAuth sign-in link
  end

  def create
    #accepts OAuth information from Spotify, finds or creates a User account, and sets user_id in session
  end

  def destroy
    #deletes user_id from session
      # session.delete :user_id
      # redirect_to root_path
  end
end
