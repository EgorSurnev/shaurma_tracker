class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def edit
    # @place уже найден благодаря set_place
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to @place, notice: 'Точка создана!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Информация обновлена!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path, notice: 'Точка удалена.'
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :address, :location_url)
  end

  def authorize_owner!
    unless current_user.admin? || @place.user == current_user
      redirect_to places_path, alert: 'У вас нет прав на это действие!'
    end
  end
end