class StructuresController < ApplicationController
 before_action :authenticate_user!, only: [:new, :show, :update]
  def index
    
  end
  
  def new
    @song_id = params[:song]
  end

  def create

  end

  def edit
    
  end

  def update

    @song = Song.find_by(id: params[:id])
    puts "aSFDDSAFSAFSAF"
    params[:structures].each do |structure_id, chord_hash|
      Structure.find_by(id: structure_id).update(chord_id: chord_hash["chord_id"])
    end
    # length = @song.structures.order(:position).count
    # position = 1
    # length.times do
    #   Structure.find_by(song_id: params[:id], position: position).update(chord_id: params[:structures][:chord_id])
    #   position += 1
    # end

    line_counter = 1
    params[:lyrics].each do |line_number, lyrics|
      Lyric.create(line_number: (line_number.to_i + 1), lyric: lyrics, song_id: @song.id)
      line_counter += 1
    end



    @lines = @song.lines

    # @lines.count.times do
    #   Lyric.create(song_id: params[:id], line_number: line_number, lyric: params[:lyric]))
    #   line_number += 1
    # end


    # Lyric.create(song_id: params[:id], line_number: line_number, lyric: params[:lyric])



    redirect_to "/songs/#{params[:id]}"
  end

  def show
    @song = Song.find_by(id: params[:id])
  end
end
