#!/usr/bin/env ruby

# these 3 lines are here so I can run the program in my terminal
# not needed for running 'learn', which supplies it's own input

require 'json'
file = File.read('./lib/contestants.json')
contestants = JSON.parse(file)


# helper method for flattening the main hash
# allows for easier access to the inner nested data without a ton of eaching!
# not all of my methods use this, but several do, so best to have it in its own method
# when I know the season, I don't need to flatten, because the season is the key to the data inside
# but if I don't have a season to use as a key, this method smashes down the door and knocks it flat!

def flatdata(data)
  data.values.flatten
end

# here I have the season, and I only need one winner, so .find is just the thing I need

def get_first_name_of_season_winner(data, season)
  winner = data[season].find { | person | person["status"] == "Winner" } #returns the 1st (only) person with a winner status for a given season
  winner["name"].split.first # returns the person name, using split.first to get only the part of th string before the first space
end

# for this one, the occupation can be in any season, so hard to get at through all the nesting
# the flatdata helper method flattens a layer of the nested structure
# this means I can search for occupations without having to .each my way through the seasons

def get_contestant_name(data, occupation)
  worker = flatdata(data).find { | person | person["occupation"] == occupation }  #assigns the first person with the give occupation to the worker variable
  worker["name"] #returns the worker's name
end

# sooo simple to do when the structure is a little flatter!

def count_contestants_by_hometown(data, hometown)
  flatdata(data).count { | person | person["hometown"] == hometown}  #counts all people in a given hometown
end

# basically the same as above, but uses find instead of count, so I can return the ["occupation"] value

def get_occupation(data, hometown)
  resident = flatdata(data).find { | person | person["hometown"] == hometown}
  resident["occupation"]
end

# here again I have the season, so don't need to flatten!

def get_average_age_for_season(data, season)
  num_people = data[season].length  #uses length to calc the number of contestants in the season
  combined_age = data[season].sum { | person | person["age"].to_i } #since ages are stored as strings, uses .to_i to convert to numbers, and .sum to total up
  (combined_age.to_f / num_people.to_f).round() # to round properly, converts both integers to floats with .to_f, then .round() to go back to an integer
end
