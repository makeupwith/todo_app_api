class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      render status: 200
    else
      flash.now[:danger] = 'Invalid email/password combination'
    end
  end

  def destroy
    log_out
  end
end