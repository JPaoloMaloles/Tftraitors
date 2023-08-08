class MatchSummonerPerformance < ApplicationRecord
  belongs_to :match
  belongs_to :summoner_info

  def parse_augment(augment)
    parsed_augment = augment.split(/(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])|(?<=[0-9])(?=[A-Z][a-z])|(?<=[a-zA-Z])(?=[0-9])|(?<=[_])/)
    stitched_augment = ""
    index = 3
    while index < first_type_string.length
      puts first_type_string[index]
      puts "index is #{index}"
      puts "length is #{first_type_string.length}"
      if index < first_type_string.length - 1
        puts "YES"
        stitched_augment = stitched_augment + first_type_string[index] + "-"
      else
        if first_type_string[index] == "1"
          stitched_augment = stitched_augment + "I"
        elsif first_type_string[index] == "2"
          stitched_augment = stitched_augment + "II"
        else
          stitched_augment = stitched_augment + "III"
        end
      end
      index += 1
    end
    return stitched_augment
  end
end
