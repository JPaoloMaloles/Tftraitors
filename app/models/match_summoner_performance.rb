class MatchSummonerPerformance < ApplicationRecord
  belongs_to :match
  belongs_to :summoner_info
end
