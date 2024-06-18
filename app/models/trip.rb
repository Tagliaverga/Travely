# class Trip < ApplicationRecord

#   belongs_to :user
#   has_many :itineraries
#   has_many :experiences, through: :itinerary
#   validates :destination, :star_date, :end_date, presence: true
#   has_one_attached :photo


# end


class Trip < ApplicationRecord
  belongs_to :user
  has_many :itineraries, dependent: :destroy
  has_many :experiences, through: :itineraries
  has_one_attached :photo

  validates :destination, :star_date, :end_date, presence: true

  after_create :generate_itineraries

  private

  def generate_itineraries

    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "create an itinerary of tourist attractions with a with a 5-word description of the place, for me to visit in #{(end_date.to_date - star_date.to_date).to_i} days in #{destination}, separating each day, separate a list of orders restarting each day"}]
    })

    descriptions = response["choices"][0]["message"]["content"].split("\n\n")

    (star_date.to_date..end_date.to_date - 1).to_a.each_with_index do |date, index|
      Itinerary.create!(trip: self, date: date, description: descriptions[index] || "Dia Livre")
    end


  end


end
