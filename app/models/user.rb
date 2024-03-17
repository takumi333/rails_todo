class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable
  # deviseが提供するバリデーションを提供
  # :validatable
  has_many :tasks

  validates :name, presence: true, length: { maximum: 12 }
  validates :email, presence: true, length: { maximum: 30 }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "適切なメールアドレスではありません" }
  validates :password, presence: true, length: { maximum: 30 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "英数字のみが使えます" }, confirmation: true
  validates :password_confirmation, presence: true, length: { maximum: 12 }
end
