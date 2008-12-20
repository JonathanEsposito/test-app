class AlbumController < ApplicationController

  def add_album
    @album = Album.new(params[:album])
    if request.post?
      @album.save
      redirect_to :controller => :photos, :action => :upload_photo
    end
  end

  def show_albums

  end

end
