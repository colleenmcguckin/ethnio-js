class ChordsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def new
    @song = Song.find_by(id: params[:song])
    beat_unit = @song.time_signature.beat_unit
    structures = @song.structures.order(:position)
    @lines = []
    measures = structures.each_slice(beat_unit).to_a
    @element_ids = []
    index = 0
    while index < measures.count
      line = []
      current_element_id = measures[index][0].element_library_id
      @element_ids << current_element_id
      4.times do
        break unless measures[index]
        break if measures[index][0].element_library_id != current_element_id
        line << measures[index]
        index += 1
      end
      @lines << line
    end
    # puts "HHHHHHHHHH"
    # puts @element_ids
  end

  def edit
    @song = Song.find_by(id: params[:id])
    beat_unit = @song.time_signature.beat_unit
    structures = @song.structures.order(:position)
    @lines = []
    measures = structures.each_slice(beat_unit).to_a
    @element_ids = []
    index = 0
    while index < measures.count
      line = []
      current_element_id = measures[index][0].element_library_id
      @element_ids << current_element_id
      4.times do
        break unless measures[index]
        break if measures[index][0].element_library_id != current_element_id
        line << measures[index]
        index += 1
      end
      @lines << line
    end
    puts "HHHHHHHHHH"
    puts @element_ids
  end
end
