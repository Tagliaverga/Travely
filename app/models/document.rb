class Document < ApplicationRecord
  belongs_to :itinerary
  has_one_attached :photo

end
