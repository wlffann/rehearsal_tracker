class GoogleOauthSessionsController < ApplicationController
  def create
    response = request.env["omniauth.auth"] 
    uid = response.uid
    user_info = response.info
    user = User.from_oauth(uid, user_info)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end
end
