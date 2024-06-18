# class Experience < ApplicationRecord
#   belongs_to :service
#   belongs_to :itinerary
# end

class Experience < ApplicationRecord
  belongs_to :itinerary
  belongs_to :service

  validates :service_id, :itinerary_id, presence: true
end
