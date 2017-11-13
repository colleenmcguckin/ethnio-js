class Chord < ActiveRecord::Base
  has_many :chord_by_key
  has_many :structures
  has_many :keys, through: :chord_by_key
end

