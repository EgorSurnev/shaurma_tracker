class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @review = @place.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @place, notice: 'Отзыв добавлен!'
    else
      redirect_to @place, alert: 'Ошибка в отзыве.'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user.admin?
      @review.destroy
      redirect_to @review.place, notice: 'Отзыв удален админом.'
    end
  end
end