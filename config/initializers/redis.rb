<<<<<<< HEAD
=======
$redis = Redis.new(url: 'redis://localhost:6379')
>>>>>>> master
url = ENV["REDIS_URL"]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
end
