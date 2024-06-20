url = ENV["REDIS_URL"]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
else
  Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/1' }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/1' }
  end
end
