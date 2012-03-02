class PicturesController < ApplicationController
  def new
    @album = Album.find_by_id( params[:album_id] )
    @new_picture = Picture.new 
  end
  
  
  
  def create
    @album = Album.find_by_id( params[:album_id] )
    if not params[:transloadit].nil?
      new_picture = Picture.extract_uploads( 
        params[:transloadit][:results][":original".to_sym],
        params[:transloadit][:results][:resize_index], 
        params[:transloadit][:results][:resize_show], 
        params[:transloadit][:results][:resize_revision], 
        params, params[:transloadit][:uploads] )
    end 
    
    redirect_to select_cover_image_url(@album)

  end
  
  
  
  def select_cover_image
    @album = Album.find_by_id( params[:album_id])
  end
  
  
end
