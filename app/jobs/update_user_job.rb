# class UpdateUserJob < ApplicationJob
#   queue_as :default

#   def perform(user)
#     puts "Calling Clearbit API for #{user.email}..."
#     # TODO: perform a time consuming task like Clearbit's Enrichment API.
#     sleep 2
#     puts "Done! Enriched #{user.email} with Clearbit"
#   end
# end

class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Calling OpenAI API for #{user.email}..."
    client = OpenAI::Client.new
    response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: "Provide enrichment details for user with email #{user.email}",
        max_tokens: 100
      }
    )

    enriched_data = response['choices'].first['text'].strip
    puts "Done! Enriched #{user.email} with data: #{enriched_data}"
    # Aqui você pode salvar os dados enriquecidos no banco de dados, se necessário.
  end
end
