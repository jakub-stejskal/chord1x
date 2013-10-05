class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
  end

  def create
    #render text: params[:song].inspect
    @song = Song.new(song_params)
    @song.save
    redirect_to @song
  end

private
  def song_params
      params.require(:song).permit(:title, :interpret, :text)
  end
end
