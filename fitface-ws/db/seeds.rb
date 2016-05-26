# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sports = ["Bike Riding", "Football", "Basketball", "Baseball", "Soccer", "Wrestling"]
sports.each do |sport|
  if !Sport.where("name = ?", sport).present?
    sport = Sport.create(name: sport)
  end
end

gyms = ["ABC Gym", "DEF Gym", "GHI Gym", "JKL Gym", "MNO Gym"]
gyms.each do |gym|
  if !Gym.where("name = ?", gym).present?
    gym = Gym.create(name: gym, address: "Baker St. London", contact_number: "+1 234 5678")
  end
end

outdoors = ["Central Park 1", "Central Park 2", "Central Park 3", "Central Park 4", "Central Park 5"]
outdoors.each do |outdoor|
  if !OutdoorPlace.where("name = ?", outdoor).present?
    outdor = OutdoorPlace.create(name: outdoor, address: "Baker St. London")
  end
end

workouts = ["Cardio", "Cutting/Shredding", "High Intensity", "Heavy Weights", "Medium Weights", "Light Weights"]
workouts.each do |workout|
  if !Workout.where("name = ?", workout).present?
    workout = Workout.create(name: workout)
  end
end

events = ["Event 1", "Event 2", "Event 3"]
events.each do |event|
  if !Event.where("name = ?", event).present?
    event = Event.create(name: event, address: "Baker St. London")
  end
end