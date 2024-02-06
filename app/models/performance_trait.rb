class PerformanceTrait < ApplicationRecord
  belongs_to :trait
  belongs_to :match_summoner_performance
end
