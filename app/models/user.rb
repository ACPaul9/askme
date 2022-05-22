class User < ApplicationRecord
  has_secure_password

  REGEXP_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  REGEXP_NIKNAME = /\A\w+\z/
  REGEXP_COLOR = /\A#([[:xdigit:]]{3}){1,2}\z/

  before_save :downcase_nickname

  validates :nickname, uniqueness: true, length: {maximum: 40}, format: { with: REGEXP_NIKNAME }
  validates :email, presence: true, uniqueness: true, format: { with: REGEXP_EMAIL }
  validates :header_color, format: {with: REGEXP_COLOR }, on: :update

  def downcase_nickname
    nickname.downcase!
  end
end
