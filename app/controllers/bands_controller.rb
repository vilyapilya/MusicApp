class BandsController < ApplicationController

  before_action :check_login, only: [:index, :create, :new]
  def new
    render :new
  end

  def create
    band = Band.new(band_params)
    band.save!
  end

  def index
    @band = Band.all
    render :index
  end
  def show
  end

  def destroy
  end

  def edit
  end

  private

  def band_patams
    params.require(:album).permit(:name)
  end

  def check_login
    if !current_user
      redirect_to new_sessions
    end
  end
end
