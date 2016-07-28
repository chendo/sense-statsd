require "./sense/*"
require "sense-api"
require "statsd"

module Sense
  class Stats
    def initialize(email : String, password : String, statsd_host : String = "172.16.8.4")
      @client = Sense::API.new(email: email, password: password)
      @statsd = Statsd::Client.new(statsd_host)
    end

    macro log_metric(metric)
      @statsd.gauge("home.{{metric}}", sensors.{{metric}}.value, tags: ["room:bedroom"])
      puts "{{metric}}: #{sensors.{{metric}}.value}"
    end

    def run
      loop do
        begin
          sensors = @client.current_sensors

          p Time.now
          log_metric(humidity)
          log_metric(particulates)
          log_metric(temperature)
          log_metric(light)
          log_metric(sound)

          puts "-------------"
          sleep 60

        rescue ex
          STDERR.puts(ex)
        end
      end
    end
  end
end

Sense::Stats.new(email: ENV["SENSE_EMAIL"], password: ENV["SENSE_PASSWORD"]).run
