class Document < ApplicationRecord
  belongs_to :itineraries
  has_one_attached :photo
end
