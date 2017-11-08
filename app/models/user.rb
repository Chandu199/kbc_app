class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, uniqueness: true
  validates_presence_of :name, length: {minimum: 4, maximum: 20}
  validates_presence_of :phone_number, numericality: true, length: {minimum: 10, maximum: 12}
  validates_presence_of :city

  has_many :tests, as: :quiz, dependent: :destroy
end
