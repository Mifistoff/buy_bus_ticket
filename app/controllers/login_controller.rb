class LoginController < ApplicationController
  layout false

  def index

  end

  def login #if logged in go to bus list
    user = User.find_by_login(params[:login])
    if user && user.password == params[:password]
      session[:uid] = user.id
      session[:login] = user.login
      session[:role] = user.role
      redirect_to buses_path
    end
  end

  def logout #if log out go to start/login page
    if session
      reset_session
      redirect_to '/'
    end
  end
end
