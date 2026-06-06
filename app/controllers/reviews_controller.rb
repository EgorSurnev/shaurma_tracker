class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: [:create]
  before_action :set_review, only: [:destroy]
  
  def create
    @review = @place.reviews.build(review_params)
    @review.user = current_user
    
    if @review.save
      redirect_to @place, notice: 'Отзыв добавлен! 🥩'
    else
      redirect_to @place, alert: 'Ошибка при добавлении отзыва'
    end
  end
  
  def destroy
    if current_user.admin? || @review.user == current_user
      @review.destroy
      redirect_to @review.place, notice: 'Отзыв удалён'
    else
      redirect_to @review.place, alert: 'Нет прав для удаления этого отзыва'
    end
  end
  
  private
  
  def set_place
    @place = Place.find(params[:place_id])
  end
  
  def set_review
    @review = Review.find(params[:id])
  end
  
  def review_params
    params.require(:review).permit(:rating, :content, :photo)
  end
end