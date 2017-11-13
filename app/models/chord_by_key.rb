class ChordByKey < ActiveRecord::Base
  belongs_to :key
  belongs_to :chord
end

