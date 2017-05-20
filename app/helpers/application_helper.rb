module ApplicationHelper

  def user_context
    session[:login]
  end

  def user_id
    session[:uid]
  end

  def is_admin?
    session[:role] == 1
  end
end
