class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {format: { with: VALID_EMAIL_REGEX }}
  VALID_FIRST_NAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :first_name, {format: { with: VALID_FIRST_NAME_REGEX }}
  VALID_LAST_NAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :last_name, {format: { with: VALID_LAST_NAME_REGEX }}
  VALID_FIRST_NAME_PHONETIC_REGEX = /\A[ぁ-んー－]+\z/
  validates :first_name_phonetic, {format: { with: VALID_FIRST_NAME_PHONETIC_REGEX }}
  VALID_LAST_NAME_PHONETIC_REGEX = /\A[ぁ-んー－]+\z/
  validates :last_name_phonetic, {format: { with: VALID_FIRST_NAME_PHONETIC_REGEX }}
  validates :nickname, length: { minimum: 7 }
  VALID_SEND_FIRST_NAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :send_first_name, {format: { with: VALID_SEND_FIRST_NAME_REGEX }}
  VALID_SEND_LAST_NAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :send_last_name, {format: { with: VALID_SEND_LAST_NAME_REGEX }}
  VALID_SEND_FIRST_NAME_PHONETIC_REGEX = /\A[ぁ-んー－]+\z/
  validates :send_first_name_phonetic, {format: { with: VALID_SEND_FIRST_NAME_PHONETIC_REGEX }}
  VALID_SEND_LAST_NAME_PHONETIC_REGEX = /\A[ぁ-んー－]+\z/
  validates :send_last_name_phonetic, {format: { with: VALID_SEND_FIRST_NAME_PHONETIC_REGEX }}

  has_one :credit_card
end
