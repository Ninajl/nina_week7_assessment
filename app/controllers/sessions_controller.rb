class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_user_name(params[:user_name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Successfully Logged In!"
    else
      @sign_in_error = 'Username / password combination is invalid'
      render :new
    end
  end

  #logs a user out
  def destroy
    session.clear
    redirect_to root_path, notice: "Successfully Logged out!"
  end
end
