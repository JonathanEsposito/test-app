class PhotosController < ApplicationController

  def upload_photo
    puts params.inspect
    @albums = Album.find :all, :order => "title"
    @photo = Photo.new(params[:photo])
    if request.post?
      if params[:add_album]
        redirect_to :controller => :album, :action => :add_album
      else
        @photo.save
      end
    end
  end

  def display_photo
    @photo = Photo.find :last
  end

end
