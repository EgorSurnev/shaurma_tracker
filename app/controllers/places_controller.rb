class PlacesController < ApplicationController
  # Заглушка для Auth-специалиста: пока разрешаем всем всё,

  def index
    @places = Place.all
    # ЗАГЛУШКА ДЛЯ FRONTEND:
    # Переменная @places содержит список всех точек. Выводи их через .each
  end

  def show
    @place = Place.find(params[:id])
    @reviews = @place.reviews.includes(:user)
    @review = Review.new # Заготовка для формы нового отзыва
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

    # ЗАГЛУШКА: Привязываем к первому юзеру из базы,
    # пока Auth-специалист не настроил current_user
    @place.user = User.first || User.create!(email: 'test@test.com', password: 'password')

    if @place.save
      redirect_to @place, notice: 'Точка успешно добавлена!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :location_url)
  end
end