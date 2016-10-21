class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      redirect_to '/home'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  def destroy
    log_out
    redirect_to '/home'
  end
end
