Sidekiq.configure_server do |config|
  config.redis = { url: Figaro.env.redis_url, namespace: "worker" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Figaro.env.redis_url, namespace: "worker" }
end
