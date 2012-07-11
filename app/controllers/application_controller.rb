class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #before_filter :authorize
  
  protected
  
  def current_user
    if session[:user_id] == nil
      return nil
    end
    User.find(session[:user_id])
  end
  
  def authorize
    unless self.current_user
      redirect_to login_url, notice: 'Please log in first'
    end
  end
  
end
