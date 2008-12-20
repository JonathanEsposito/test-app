class PhotosController < ApplicationController

  def upload_photo
    @albums = Album.find :all, :order => "title"
    @photo = Photo.new(params[:photo])
    if request.post?
      @photo.save
    end
  end

  def display_photo
    @photo = Photo.find :last
  end

end