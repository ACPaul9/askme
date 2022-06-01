class User < ApplicationRecord
  has_secure_password

  REGEXP_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  REGEXP_NIKNAME = /\A\w+\z/
  REGEXP_COLOR = /\A#([[:xdigit:]]{3}){1,2}\z/

  before_validation :downcase_nickname, :downcase_email

  validates :nickname, presence: true, uniqueness: true, length: {maximum: 40}, format: { with: REGEXP_NIKNAME }
  validates :email, presence: true, uniqueness: true, format: { with: REGEXP_EMAIL }
  validates :header_color, format: {with: REGEXP_COLOR }, on: :update

  has_many :questions, dependent: :delete_all

  def to_param
    nickname
  end

  private

  def downcase_email
    email.downcase!
  end

  def downcase_nickname
    nickname.downcase!
  end
end
