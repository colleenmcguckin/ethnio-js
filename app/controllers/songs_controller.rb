class SongsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :show]

  def index
    # puts "??????????"

    # if params[:keysignature] && params[:timesignature]
    #   puts "AAAAAA"
    #   @songs = Song.where(key_id: params[:keysignature], time_signature_id: params[:timesignature])
    # elsif params[:keysignature]
    #   puts "BBBBBBBBB"
    #   puts params[:keysignature]
    #   @songs = Song.where(key_id: params[:keysignature])
    # elsif params[:timesignature]
    #   puts "CCCCCCCC"
    #   @songs = Song.where(time_signature_id: params[:timesignature])
    # elsif params[:song_name]
    #   puts "DDDDDDDDD"
    #   @songs = Song.where("name LIKE (?)",  "%#{params[:song_name]}%" )
    # else
    #   puts "EEEEEEE"
    #   @songs = Song.all
    # end


  end

  def new
    @tonics = Key.all
  end

  def create
    @song = Song.create({name: params[:name], time_signature_id: params[:time_signature][:time_signature_id], tempo_id: params[:tempo][:tempo_id], key_id: params[:key][:key_id]})
  end


  def show
    @song = Song.find_by(id: params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = LeadSheetPdf.new(@song.id)
        send_data pdf.render, filename: "#{@song.name}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end


end
