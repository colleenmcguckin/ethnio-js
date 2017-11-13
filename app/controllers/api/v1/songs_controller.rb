class Api::V1::SongsController <ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @songs = Song.where(user_id: current_user.id)
    @keys = Key.all
    @time_signatures = TimeSignature.all
    @tempos = Tempo.all
    @elements = ElementLibrary.all
  end

  def create
    @song = Song.new(name: params[:title], key_id: params[:key], time_signature_id: params[:time_signature], tempo_id: params[:tempo], user_id: current_user.id)
    if @song.save
      render json: { song_id: @song.id }, status: 200
    else
      render json: { errors: @release.errors.full_messages }, status: 422
    end
  end

end