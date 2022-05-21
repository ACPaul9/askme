class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :nickname, uniqueness: true, length: {maximum: 40}, format: { with: /\A[a-z_0-9]+\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  validates :header_color, format: {with: /\A#[a-f0-9]{6}\z/i }
  
  def downcase_nickname
    nickname.downcase!
  end
end
