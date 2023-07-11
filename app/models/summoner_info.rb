class SummonerInfo < ApplicationRecord
  has_many :match_summoner_performances
  has_many :matches, through: :match_summoner_performances
end
