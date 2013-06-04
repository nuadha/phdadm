class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def current_user
    User.find(session[:user_id])  
  end
  
  def set_current_user(user_id)
    session[:user_id] = user_id
  end
end
