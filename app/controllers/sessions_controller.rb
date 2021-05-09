class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:uid] = user.uid
    redirect_to "/", notice: "Signed in!"
  end

  def destroy
    session[:uid] = nil
    redirect_to "/", notice: "Signed out!"
  end

  def login
  end
end
