class LoginController < ApplicationController
  layout false

  def index

  end

  def login
    user = User.find_by_login(params[:login])
    if user && user.password == params[:password]
      session[:uid] = user.id
      session[:login] = user.login
      session[:role] = user.role
      redirect_to buses_path
    end
  end

  def logout
    if session
      reset_session
      redirect_to '/'
    end
  end
end
