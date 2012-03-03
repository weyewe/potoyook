class Album < ActiveRecord::Base
  validates :title, :length => { :minimum => 2 }
  has_many :pictures
  belongs_to :project
  
  
  
  def self.cover_update( album_id, picture_id, decision )
    # teacher teaches a subject based on subject_teaching_assignment 
    album = Album.find_by_id( album_id )
    if decision == TRUE_CHECK
      album.cover_picture_id = picture_id
      album.save 
    elsif decision == FALSE_CHECK
      album.cover_picture_id = nil
      album.save
    end
    
    
    return album
  end
  
  def cover_picture
    
    cover_picture = Picture.find_by_id( self.cover_picture_id )
    
    if cover_picture.nil?
      if self.pictures.count == 0 
        return nil
      else
        return self.pictures.first 
      end
    else
      return cover_picture 
    end
    
  end
end
