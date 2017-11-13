class Api::V1::StructuresController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    # element_1 = params[:element_1][:element_library_id]
    # @length_1 = params[:length][:length_id_1].to_i
    # element_2 = params[:element_1][:element_library_id]
    # @length_2 = params[:length][:length_id_2].to_i
    # song_id = params[:song_id]
    _json = params[:_json]

    position = 1

    _json.each do |element|
      puts "chocolate"
      p element[:song_id]
      beat_unit = Song.find_by(id: element[:song_id]).time_signature.beat_unit
      puts "pretzel"
      p beat_unit
      element_number = (element[:elementLength]).to_i
      puts "cheese"
      p element_number
      element_length = beat_unit*element_number
    

      element_length.times do 
        Structure.create(position: position, element_library_id: element[:elementId], song_id: element[:song_id])
        position += 1
      end
      
    end
    render json: {}, status: 200
    # ((Song.find_by(id: @song.id).time_signature.beat_unit)*(@length_1)).times do 
    #   Structure.create(position: position, element_library_id: element_1, song_id: song_id)
    #   position += 1
    # end

  end
end