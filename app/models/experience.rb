class Experience < ApplicationRecord
  belongs_to :service
  belongs_to :itinerary
  has_many :users, through: :services
end
