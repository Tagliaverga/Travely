# class Itinerary < ApplicationRecord
#   belongs_to :trip
#   has_many :experiences
#   has_many :documents, dependent: :destroy
# end

class Itinerary < ApplicationRecord
  belongs_to :trip
  has_many :experiences, dependent: :destroy

  validates :description, :date, presence: true

  # def content()
  #   client = OpenAI::Client.new
  #   chaptgpt_response = client.chat(parameters: {
  #     model: "gpt-3.5-turbo",
  #     messages: [{ role: "user", content: "create an itinerary of tourist attractions with a with a 5-word description of the place, for me to visit in #{(trip.end_date.to_date - trip.star_date.to_date).to_i} days in #{trip.destination}, separating each day, separate a list of orders restarting each day"}]
  #   })
  #   return chaptgpt_response["choices"][0]["message"]["content"]
  # end

end
