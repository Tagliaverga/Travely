class User < ApplicationRecord
  has_many :trips

  has_many :services

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :city, :country, presence: true, on: :update
  # validates :contractor, presence: true

  # has_one_attached :photo

end
