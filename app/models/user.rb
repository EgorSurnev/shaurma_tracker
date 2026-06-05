class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :places
  has_many :reviews

  enum :role, { user: 0, admin: 1 }

  def admin?
    super || self.email == "admin@rnd.ru"
  end
end