class Place < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, :address, presence: true

  # Метод для вычисления среднего рейтинга
  def average_rating
    return 0 if reviews.empty?
    reviews.average(:rating).to_f.round(1)
  end
end