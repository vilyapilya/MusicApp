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
    logout_user!(current_user)
    redirect_to new_sessions_url
  end

private

  def user_params
    params.require(:user).permit(:email, :password)
  end



end
