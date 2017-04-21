class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    @user.session_token == session[:session_token]
  end

  def login_user!(user)
    token = user.reset_session_token!
    session[:session_token] = token
  end

  def logout_user!(user)
    user.reset_session_token! unless user.nil?
    session[:session_token] = nil
  end

  def check_login
    if current_user
      redirect_to user_url(@current_user)
    else
      login_user!(current_user)
    end
  end

end
