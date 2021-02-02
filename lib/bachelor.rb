#!/usr/bin/env ruby

require 'json'
file = File.read('./lib/contestants.json')
contestants = JSON.parse(file)
# p contestants

def get_first_name_of_season_winner(data, season)
  winner = ''
  season_data = data.find { | key, index | key == season }  #returns the correct season
  season_data[1].each do | person | #loops over the people - I'm not thrilled with that [1] ... is there a better enumeratior?
    if person["status"] == "Winner"
      winner = person["name"].split.first
    end  
  end
  return winner    
end  


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

get_contestant_name(contestants, "Cruise Ship Singer")

def count_contestants_by_hometown(data, hometown)
  # code here
end

def get_occupation(data, hometown)
  # code here
end

def get_average_age_for_season(data, season)
  # code here
end
