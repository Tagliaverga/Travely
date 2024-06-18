# class Experience < ApplicationRecord
#   belongs_to :service
#   belongs_to :itinerary
# end

class Experience < ApplicationRecord
  belongs_to :itinerary
  belongs_to :service
  belongs_to :user
  validates :service_id, :itinerary_id, :user_id, presence: true
end

