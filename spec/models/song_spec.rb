require "rails_helper"

describe Song do
  it "works" do
    expect{Song.new}.to_not raise_error
  end

  describe '#lines' do
    context 'with nothing else set up' do
      time_signature = TimeSignature.create(beat_unit: 2, bar: 4, name: '2/4')
      new_song = Song.create(time_signature_id: time_signature.id)
      it 'returns an empty array for a new song' do
        expect(new_song.lines).to eq []
      end
    end
    context 'with a bunch of data' do
      time_signature = TimeSignature.create(beat_unit: 2, bar: 4, name: '2/4')
      tempo = Tempo.create(bpm: 120)
      key = Key.create(tonic: 'C', quality: 'Major')
      new_song = Song.create(time_signature_id: time_signature.id)
      structure = Structure.create(song_id: new_song.id, position: 0, element_library_id: 2)

      it "returns an array with lines of the song" do
        expect(new_song.lines).to eq [[[structure]]]
      end
    end
  end
end
