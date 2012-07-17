class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize_user, :only =>[]
  #before_filter :authorize_admin, :only =>[ :edit, :update, :destroy, :create ]
  
  protected
  
  def current_user
    if session[:user_id] == nil
      return nil
    end
    User.find(session[:user_id])
  end
  
  def authorize_user
    unless self.current_user
      redirect_to login_url, alert: 'Please log in first'
    end
  end
  
  def authorize_admin
    if self.current_user == nil
      self.authorize_user
      return
    end
    
    unless self.current_user.admin
      redirect_to login_url, alert: 'Please log in as an admin'
    end
  end
  
end
