class Picture < ActiveRecord::Base
  belongs_to :album
  

=begin
  For storage calculation 
=end

  def images_size
    self.original_image_size + 
      self.byproduct_image_size
  end

  def byproduct_to_original_ratio
    self.byproduct_image_size / self.original_image_size.to_f
  end

  def byproduct_image_size
    self.display_image_size + 
      self.index_image_size + 
        self.revision_image_size
  end
  
  
=begin
  Extracting transloadit uploads
=end



  def self.extract_uploads(resize_original, resize_index , resize_show, resize_revision, params, uploads )
    # project_submission = ProjectSubmission.find_by_id(params[:project_submission_id] )
  
    new_picture = ""
    image_name = ""
  
    # begin looping data, incase of multiple images 
      counter = 0 
    
      # start looping all the transloadit data
      uploads.each do |upload|
        original_id = upload[:original_id]

        original_image_url  = ""
        index_image_url     = ""
        revision_image_url  = ""
        display_image_url   = ""
        original_image_size    = ""
        index_image_size       = ""
        revision_image_size    = ""
        display_image_size     = ""
      
      
        resize_original.each do |r_index|
          if r_index[:original_id] == original_id 
            original_image_url  = r_index[:url]
            original_image_size = r_index[:size]
            image_name = r_index[:name]
            break
          end
        end
      
      
        resize_index.each do |r_index|
          if r_index[:original_id] == original_id 
            index_image_url  = r_index[:url]
            index_image_size = r_index[:size]
            break
          end
        end
      
        resize_show.each do |s_index|
          if s_index[:original_id] == original_id 
            display_image_url  = s_index[:url]
            display_image_size  = s_index[:size]
            break
          end
        end
      
      
        resize_revision.each do |s_index|
          if s_index[:original_id] == original_id 
            revision_image_url  = s_index[:url]
            revision_image_size  = s_index[:size]
            break
          end
        end
      
        new_picture = Picture.create(
             :original_image_url => original_image_url     ,
             :index_image_url    =>   index_image_url      ,
             :revision_image_url =>   revision_image_url   ,
             :display_image_url  =>  display_image_url     ,
             :original_image_size    => original_image_size      ,
             :index_image_size       => index_image_size         ,
             :revision_image_size    => revision_image_size      ,
             :display_image_size     => display_image_size       ,
             :name => image_name,
             :album_id => params[:album_id]
        )
      
        counter =  counter + 1 
      
        #  for the UserActivity timeline event 
        # UserActivity.create_new_entry(EVENT_TYPE[:submit_picture], 
        #                     project_submission.user , 
        #                     new_picture , 
        #                     project_submission.project  )
        #    
        #   project_submission.update_submission_data( new_picture )
      end
 
  

  
  
    return new_picture
  end
  
  
  def selected_as_cover?
    self.album.cover_picture_id == self.id 
  end


    
    
end
