# class Trip < ApplicationRecord

#   belongs_to :user
#   has_many :itineraries
#   has_many :experiences, through: :itinerary
#   validates :destination, :star_date, :end_date, presence: true
#   has_one_attached :photo


# end


class Trip < ApplicationRecord
  belongs_to :user
  has_many :itineraries, dependent: :destroy
  has_many :experiences, through: :itineraries
  has_one_attached :photo

  validates :destination, :star_date, :end_date, presence: true
end
