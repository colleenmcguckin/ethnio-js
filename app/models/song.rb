class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :time_signature
  belongs_to :tempo
  belongs_to :key
  has_many :elements
  has_many :structures
  has_many :lyrics

  def lines
    beat_unit = time_signature.beat_unit
    song_structures = structures.order(:position)
    lines = []
    measures = song_structures.each_slice(beat_unit).to_a
    index = 0
    while index < measures.count
      line = []
      current_element_id = measures[index][0].element_library_id
      4.times do
        break unless measures[index]
        break if measures[index][0].element_library_id != current_element_id
        line << measures[index]
        index += 1
      end
      lines << line
    end
    lines
  end

end
