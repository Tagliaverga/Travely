class User < ApplicationRecord
  has_many :trips, dependent: :destroy
  has_many :itineraries, through: :trips
  has_many :services, dependent: :destroy
  has_many :experiences, through: :services

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :city, :country, presence: true, on: :update
  # validates :contractor, presence: true

  after_commit :async_update, on: [:create, :update]
  # has_one_attached :photo
  
  def full_name
    "#{first_name} #{last_name}"
  end


  private

  def async_update
    UpdateUserJob.perform_later(self)
  end

end
