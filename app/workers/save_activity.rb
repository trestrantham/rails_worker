class HardWorker
  include Sidekiq::Worker

  def perform(value)
    Activity.create!(desc: "Result from Elixir", value: value)
  end
end
