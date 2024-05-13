class Match < ApplicationRecord
  has_many :match_summoner_performances
  has_many :summoner_infos, through: :match_summoner_performances

  validates :riot_match_id, uniqueness: true
end
