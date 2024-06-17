OpenAI.configure do |config|
  config.access_token = ENV.fetch("api-key")
end
