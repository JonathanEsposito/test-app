class AlbumController < ApplicationController

  def add_album
    @album = Album.new(params[:album])
  end

  def show_albums

  end

end
