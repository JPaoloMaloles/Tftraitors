class MatchSummonerPerformance < ApplicationRecord
  belongs_to :match
  belongs_to :summoner_info

  def parse_augment_image(augment)
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    augment = augment.to_s
    puts augment
    puts augment.class
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    parsed_augment = augment.split(/(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])|(?<=[0-9])(?=[A-Z][a-z])|(?<=[a-zA-Z])(?=[0-9])|(?<=[_])/)
    stitched_augment = ""
    index = 3
    while index < parsed_augment.length
      puts parsed_augment[index]
      puts "index is #{index}"
      puts "length is #{parsed_augment.length}"
      if index < parsed_augment.length - 1
        puts "YES"
        stitched_augment = stitched_augment + parsed_augment[index] + "-"
      else
        if parsed_augment[index] == "1"
          stitched_augment = stitched_augment + "I"
        elsif parsed_augment[index] == "2"
          stitched_augment = stitched_augment + "II"
        elsif parsed_augment[index] == "3"
          stitched_augment = stitched_augment + "III"
        else
          stitched_augment = stitched_augment + parsed_augment[index]
        end
      end
      index += 1
    end
    stitched_augment = stitched_augment + ".TFT_Set#{parsed_augment[1][0]}.png"
    return stitched_augment
  end
end
