class Service < ApplicationRecord
  belongs_to :user
  
  validates :price, :local, :description, presence: true
end
