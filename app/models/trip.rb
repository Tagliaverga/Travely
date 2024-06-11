class Trip < ApplicationRecord
  belongs_to :user
  has_many :itineraries
  validates :destination, :star_date, :end_date, presence: true
end
