class SessionsController < ApplicationController
  skip_before_filter :authorize_admin, :authorize_user
  #layout nil
  
  def new
    render :layout => false
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user and user.authenticate params[:password]
      session[:user_id] = user.id
      if user.admin
        redirect_to admin_url
      else
        redirect_to root_url
      end
    else
      redirect_to login_url, alert: "#{params[:email]} and #{params[:password]} is not a valid combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Logged Out"
  end

end
