# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
temps = (50...80).to_a
moistures = (10...50).to_a
lights = (10...70).to_a
number = 168
number.times do |i|
  GardenMonitor.create(
    name: 'pbox1',
    temp: temps.sample,
    moisture: moistures.sample,
    light: lights.sample,
    created_at: Time.zone.now - (number - i).hours
  )
end
