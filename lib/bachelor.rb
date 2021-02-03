#!/usr/bin/env ruby

require 'json'
file = File.read('./lib/contestants.json')
contestants = JSON.parse(file)
# p contestants

def OLD_get_first_name_of_season_winner(data, season)
  winner = ''
  season_data = data.find { | key, value | key == season }  #returns the correct season
  season_data[1].each do | person | #loops over the people - I'm not thrilled with that [1] ... is there a better way?
    if person["status"] == "Winner"
      winner = person["name"].split.first
    end  
  end
  return winner    
end 

def get_first_name_of_season_winner(data, season)
  winner = data[season].filter { | person | person["status"] == "Winner" }
  winner[0]["name"].split.first
end

get_first_name_of_season_winner(contestants, "season 10")


## better figure out how to use .map!


def get_contestant_name(data, occupation)
  contestant = ''
  data.each do | season, season_data |
    season_data.each do | person |
      if person["occupation"] == occupation
        contestant = person["name"]
      end  
    end 
   end  
  p contestant
  return contestant  
end

# get_contestant_name(contestants, "Cruise Ship Singer")

def count_contestants_by_hometown(data, hometown)
  hometown_count = 0
  data.each do | season, season_data |
    season_data.each do | person |
      if person["hometown"] == hometown
        hometown_count += 1
      end  
    end 
   end  
  p hometown_count
  return hometown_count 
end

# count_contestants_by_hometown(contestants, "Hollywood, California")

def get_occupation(data, hometown)
  data.each do | season, season_data |
    season_data.each do | person |
      if person["hometown"] == hometown
        p person["occupation"]
        return person["occupation"]
      end  
    end
  end  
end

# get_occupation(contestants, "Cranston, Rhode Island" )

def get_average_age_for_season(data, season)
  combined_age = 0
  average_age = 0
  season_data = data.find { | key, value | key == season }  #returns the correct season
  season_data[1].each do | person |
    combined_age += person["age"].to_i
  end
  # p combined_age
  # p season_data[1].length
  p (combined_age.to_f / season_data[1].length.to_f).round()
  return (combined_age.to_f / season_data[1].length.to_f).round()
end





