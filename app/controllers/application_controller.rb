class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id:session[:user_id])
  end

  helper_method :current_user


  def user_logged_in!
    if not current_user
      redirect_to signin_path, notice: "Not signed in!"
    end
  end

  def current_user?
    current_user.present
  end

end
