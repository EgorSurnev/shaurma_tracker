class Place < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, :address, presence: true
end