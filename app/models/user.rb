class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, , format: { with: VALID_EMAIL_REGEX }}
  VALID_FIRST_NAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :first_name, {presence: true, , format: { with: VALID_EMAIL_REGEX }}

  validates :nickname, presence: true, length: { minimum: 7 }
end
