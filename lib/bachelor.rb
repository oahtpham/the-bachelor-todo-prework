require 'pry'

hash = {:"season 30"=>[{
  :name=>"Beth Smalls",
  :age=>"26",
  :hometown=>"Great Falls, Virginia",
  :occupation=>"Nanny/Freelance Journalist",
  :status=>"Winner"}, {
    :name=>"Becca Tilley",
    :age=>"27",
    :hometown=>"Shreveport, Louisiana",
    :occupation=>"Chiropractic Assistant",
    :status=>"Eliminated Week 8"}],
    :"season 29"=>
    [{:name=>"Ashley Yeats", :age=>"24", :hometown=>"Denver, Colorado", :occupation=>"Dental Assitant", :status=>"Winner"}, {:name=>"Sam Grover", :age=>"29", :hometown=>"New York, New York", :occupation=>"Entertainer", :status=>"Eliminated Week 6"}]}

def get_first_name_of_season_winner(data, season)
  data.each do |szn, contestants_array|
    if szn == season
      contestants_array.each do |contestant_hash|
        if contestant_hash["status"] == "Winner"
          return contestant_hash["name"].split.first
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |szn, contestants_array|
    contestants_array.each do |contestant_hash|
      if contestant_hash["occupation"] == occupation
        return contestant_hash["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  i = 0
  data.each do |szn, contestants_array|
    contestants_array.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        i = i + 1
      end
    end
  end
  return i
end

def get_occupation(data, hometown)
  data.each do |szn, contestants_array|
    contestants_array.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        return contestant_hash["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  ages_array = []
  total_ages = nil
  data.each do |szn, contestants_array|
    if szn == season
      contestants_array.each do |contestant_hash|
        age_integer = contestant_hash["age"].to_i
        ages_array.push(age_integer)
      end
    end
  end
  ages_array.inject do |sum, n|
    total_ages = (sum + n)
  end
  average = (total_ages.to_f)/(ages_array.length.to_f)
  average.round
end
