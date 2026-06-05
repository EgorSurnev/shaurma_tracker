class ReviewsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @review = @place.reviews.build(review_params)

    # ВРЕМЕННАЯ ЗАГЛУШКА: Привязываем к первому юзеру
    @review.user = User.first

    if @review.save
      # ЗАГЛУШКА ДЛЯ SPA (Turbo):

      redirect_to @place, notice: 'Отзыв добавлен!'
    else
      redirect_to @place, alert: 'Ошибка в отзыве.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end