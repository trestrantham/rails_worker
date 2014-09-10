class TripleNumber
  include Sidekiq::Worker

  def perform_async(value)
    queue = "queue:elixir"
    json = { 
      queue: queue,
      class: "TripleNumber",
      args: value,
      jid: SecureRandom.hex(12),
      enqueued_at: Time.now.to_f
    }.to_json

    client = Sidekiq.redis { |conn| conn }
    client.lpush(queue, json)
  end
end
