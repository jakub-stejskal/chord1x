class SongsController < ApplicationController

  def index
  end

  def new
  end

  def create
    render text: params[:song].inspect
  end

end
