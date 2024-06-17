class Itinerary < ApplicationRecord
  belongs_to :trip
  has_many :experiences
  has_many :documents, dependent: :destroy
end
