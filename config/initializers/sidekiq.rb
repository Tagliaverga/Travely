Sidekiq.configure_server do |config|
<<<<<<< HEAD
  config.redis = { url: 'redis://localhost:6380' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6380' }
=======
  config.redis = { url: 'redis://localhost:6379' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379' }
>>>>>>> master
end
