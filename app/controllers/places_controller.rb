class PlacesController < ApplicationController
  # Гость может видеть только список и одну точку. Все остальное — только для профи.
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_admin!, only: [:destroy]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params) # Привязываем к текущему юзеру
    if @place.save
      redirect_to @place, notice: 'Точка добавлена!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_path, notice: 'Точка удалена админом.'
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :location_url)
  end

  # Метод проверки на админа
  def authorize_admin!
    redirect_to root_path, alert: 'У вас нет прав администратора' unless current_user&.admin?
  end
end