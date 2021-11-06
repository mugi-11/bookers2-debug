class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image, destroy: false
  has_many :book_comment, dependent: :destroy

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true, presence: true
  validates :introduction, length: {maximum: 50}
end
