class Key < ActiveRecord::Base
  has_many :songs
  has_many :chord_by_key
  has_many :chords, through: :chord_by_key
end

