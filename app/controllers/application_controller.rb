class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_login_check #if not log in go to start/login page
    if !session[:uid] || !session[:login]
      redirect_to '/'
    end
  end

end
