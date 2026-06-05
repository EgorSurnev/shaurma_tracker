class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :places
  has_many :reviews

  enum :role, { user: 0, verified: 1, admin: 2 }

  def admin?
    super || self.email == "admin@rnd.ru"
  end

  def gravatar_url(size = 100)
    hash = Digest::MD5.hexdigest(email.strip.downcase)
    "https://www.gravatar.com/avatar/#{hash}?s=#{size}&d=identicon"
  end
end