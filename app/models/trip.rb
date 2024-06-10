class Trip < ApplicationRecord
  belongs_to :user

  validates :destination, :star_date, :end_date, presence: true
end
