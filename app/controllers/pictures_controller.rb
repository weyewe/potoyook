class PicturesController < ApplicationController
  def new
    @album = Album.find_by_id( params[:album_id] )
    @new_picture = Picture.new 
    
    add_breadcrumb "Create Submission Details", dashboard_path 
    set_breadcrumb_for @subject, 'new_album_picture_path' + "(#{@album.id})" +"#playground", 
                "Upload Images for #{@album.title}"
                
  end
  
  
  
  def create
    @album = Album.find_by_id( params[:album_id] )
    
    handle_picture_upload( params ) 
    
    
    first_picture = @album.pictures.first 
    @album.cover_picture_id = first_picture.id
    @album.save 
    redirect_to select_cover_image_url(@album) + "#playground"
    
  end
  
  def upload_more_pictures
    @album = Album.find_by_id( params[:album_id] )
    
    handle_picture_upload( params ) 
    
    source = params[:source].to_i
    puts "The source is #{source}\n"*100
    
    
   
    if params[:source].to_i == FROM_DASHBOARD
      redirect_to dashboard_url #(@album) + "#playground"
    else
      redirect_to select_cover_image_url(@album) + "#playground"
    end
   end
  
  
  
  
  def select_cover_image
    @album = Album.find_by_id( params[:album_id])
    
    
    add_breadcrumb "Create Submission Details", dashboard_path 
    set_breadcrumb_for @subject, 'new_album_picture_path' + "(#{@album.id})" +"#playground", 
                "Upload Images for #{@album.title}"
    set_breadcrumb_for @subject, 'select_cover_image_path' + "(#{@album.id})" +"#playground", 
                "Select Cover for  #{@album.title}"
                
                
  end
  
  def execute_select_cover
    @album_id = params[:membership_provider]
    @picture_id = params[:membership_consumer]
    @decision = params[:membership_decision].to_i

    @picture  = Picture.find_by_id @picture_id

    @album = Album.cover_update( @album_id, @picture_id, @decision )


    respond_to do |format|
      format.html {  redirect_to new_subject_subject_teaching_assignment_path(@subject)}
      format.js
    end
  end
  
 
  protected
  def handle_picture_upload( params  )
    if not params[:transloadit].nil?
      new_picture = Picture.extract_uploads( 
        params[:transloadit][:results][":original".to_sym],
        params[:transloadit][:results][:resize_index], 
        params[:transloadit][:results][:resize_show], 
        params[:transloadit][:results][:resize_revision], 
        params, params[:transloadit][:uploads] )
    end
  end

  
end
