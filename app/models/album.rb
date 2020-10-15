class Album < ApplicationRecord
  belongs_to :artist

  validates :name, presence: true
  validates :year, presence: true,
                   format: { with: /\A(19|[2-9][0-9])\d{2}\z/,
                             message: 'Needs to follow the format: yyyy' }
  validates :artist, presence: true
end
