class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one_attached :photo
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true
end