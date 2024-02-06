class PerformanceUnit < ApplicationRecord
  belongs_to :unit
  belongs_to :match_summoner_performance
end
