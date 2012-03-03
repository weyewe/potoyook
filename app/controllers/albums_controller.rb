class AlbumsController < ApplicationController
  def create
    @album = Album.new( params[:album])
    @album.project_id = Project.last.id
    @album.user_id = current_user.id 
    if @album.save 
      redirect_to new_album_picture_url( @album) + "#playground"
    end
    
    # if save fails, it will be redirected to controller => albums, :action => create 
    
    add_breadcrumb "Create Submission Details", dashboard_path 
    
    
  end
  
  
  def see_album_content
    @album = Album.find_by_id( params[:album_id])
    @pictures = @album.pictures
  end
end
