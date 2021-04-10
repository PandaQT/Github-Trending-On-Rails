class SessionsController < ApplicationController
  
  #def new
  #end

  # Create a session on login
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid Username or Password'
      render 'new'
    end
  end

  # Destroy session on logout
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
