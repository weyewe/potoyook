class AlbumsController < ApplicationController
  def create
    @album = Album.new( params[:album])
    if @album.save 
      redirect_to new_album_picture_url( @album)
    end
    
    # if save fails, it will be redirected to controller => albums, :action => create 
  end
end
