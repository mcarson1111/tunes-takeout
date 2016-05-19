class SessionsController < ApplicationController
  #skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']  #omniauth puts data it gets from github into this hash (request variables from github)
    if auth_hash[:info][:id]
      @user = User.find_or_create_from_omniauth(auth_hash)
      if @user
        session[:user_id] = @user.id
        redirect_to suggestions_path
      else
        redirect_to suggestions_path, notice: "Failed to save the user"
      end

    else
      redirect_to suggestions_path, notice: "Failed to authenticate"
    end

    #user = User.log_in(params[:email], params[:password])
    # if user
    #   session[:user_id] = user.id
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
