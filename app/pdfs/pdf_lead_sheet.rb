class PdfLeadSheet < Prawn::Document
  
def initialize(id)
  song = Song.find_by(id: id)
  logo = "#{Rails.root}/app/assets/images/notebook-nav-icon.png"
  previous_chord = ""
  beat_unit = song.time_signature.beat_unit
  counter = 0
  

  super(left_margin: 40)
    image logo, :scale => 0.5 

    move_down 8

    text song.name, :align => :center, :size => 40, :scale => 0.5

    move_down 10

    text "Key: " + song.key.tonic + "   Time Signature: " + song.time_signature.name + "   Tempo: " + song.tempo.bpm.to_s + " bpm", :align => :center

    move_down 20

    

    stroke do 
      horizontal_line 148, 380, :at => 635, :color => "#0000FF"
    end
    
      index = 1
      string = ""
      song.lines.each do |measure|
        move_down 10
        text ElementLibrary.find_by(id: measure[0][0].element_library_id).name, :style => :bold, :size => 14 
        measure.each do |structure|
          structure.each do |object|
            counter += 1
            if object.chord.name == previous_chord
              string += " / "
            else
            string += " " + Chord.find_by(id: object.chord_id).name + " "
          end
            if counter == beat_unit
              previous_chord=""
              counter = 0
            else
            previous_chord = object.chord.name
            end
          end
            string += " | "
        end

        text string, :align => :justify
        string = ""
        text Lyric.where(song_id: song.id, line_number: index)[0].lyric, :style => :italic, :color => "B2B2B2"
        index += 1
    
  end
end



end