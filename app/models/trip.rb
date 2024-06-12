class Trip < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [ :first_name, :last_name, :email ],
                              using: {
                                tsearch: { prefix: true }
                              }

  belongs_to :user
  has_many :itineraries
  validates :destination, :star_date, :end_date, presence: true
end
