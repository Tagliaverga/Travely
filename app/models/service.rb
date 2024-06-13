class Service < ApplicationRecord
  belongs_to :user
  has_one :experience

  validates :price, :local, :description, presence: true
end
