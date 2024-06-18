# class Itinerary < ApplicationRecord
#   belongs_to :trip
#   has_many :experiences
#   has_many :documents, dependent: :destroy
# end

class Itinerary < ApplicationRecord
  belongs_to :trip
  has_many :experiences, dependent: :destroy

  validates :description, :date, presence: true
end
