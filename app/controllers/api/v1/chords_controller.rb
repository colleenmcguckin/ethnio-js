class Api::V1::ChordsController <ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def show
    @chords = Song.find_by(id: params[:id]).key.chords
  end
end
