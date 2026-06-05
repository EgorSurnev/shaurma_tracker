class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true
  has_many_attached :photos
end