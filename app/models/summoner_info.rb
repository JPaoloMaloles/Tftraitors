class SummonerInfo < ApplicationRecord
  has_many :match_summoner_performances
  has_many :matches, through: :match_summoner_performances
  has_many :performance_traits, through: :match_summoner_performances
  has_many :performance_units, through: :match_summoner_performances
  has_many :traits, through: :performance_traits
  has_many :units, through: :performance_units

  validates :summoner_name, uniqueness: true
end
