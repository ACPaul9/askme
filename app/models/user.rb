class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :nickname, uniqueness: true, length: {maximum: 40}, format: { with: /\A[a-z_]+\d+\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }


  def downcase_nickname
    nickname.downcase!
  end
end
