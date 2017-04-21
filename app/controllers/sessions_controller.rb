class SessionsController < ApplicationController

  before_action :check_login, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:error] = "You have to log in!"
    end
  end

  def destroy
    if @user &&  logged_in?
      session[:session_token] = nil
      @user.reset_session_token!
    end
  end

private

def user_params
  params.require(:user).permit(:email, :password)
end

def check_login
  if current_user
    redirect_to user_url(@current_user)
  end
end


end
