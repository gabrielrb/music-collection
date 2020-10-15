require 'open-uri'

class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true,
                   inclusion: { in: :artist_name_list, message: 'You need to choose between the options available.' }

  def artist_name_list
    artists = JSON.parse(open('https://run.mocky.io/v3/46ca2011-8b43-47cf-b3d7-4df003d48469/').read)
    artist_name_list = []
    artists.each do |element|
      artist_name_list << element.last['name']
    end
    artist_name_list
  end
end
