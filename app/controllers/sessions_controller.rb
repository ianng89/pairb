class SessionsController < ApplicationController

def create
  auth = request.env["omniauth.auth"]
  user = User.where(:provider => auth['provider'], 
                    :uid => auth['uid']).first || User.create_with_omniauth(auth)
  sign_in(user)
  redirect_to root_url, :notice => "Signed in!"
end

def new
  redirect_to '/auth/facebook'
end

def destroy
  reset_session
  redirect_to root_url, notice => 'Signed out'
end

def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]

    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user 
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!"
    else
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      @next = edit_user_path(user)   
      @notice = "User created - confirm or edit details..."
    end
    sign_in(user)
    redirect_to @next, :notice => @notice
  end


end
