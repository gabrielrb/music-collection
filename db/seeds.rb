# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "Starting..."

Artist.destroy_all

artists = JSON.parse(open('https://run.mocky.io/v3/46ca2011-8b43-47cf-b3d7-4df003d48469/').read)
artists.each do |element|
  artist = Artist.new(name: element.last['name'],
                      twitter: element.last['twitter']
  )
  artist.save!

  3.times do
    Album.new(name: ["nome numero uno", "SEGUNDO NUEMBRE", "Name Number Three"].sample,
              year: rand(2000),
              artist: artist).save!
  end
end

puts "Done!"
