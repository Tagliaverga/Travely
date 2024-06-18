# class Service < ApplicationRecord
#   belongs_to :user
#   has_one :experience

#   validates :price, :local, :description, presence: true
# end

class Service < ApplicationRecord
  belongs_to :user
  has_many :experiences

  validates :description, :local, :price, :profession, presence: true
end
