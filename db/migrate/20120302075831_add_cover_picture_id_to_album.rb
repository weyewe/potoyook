class AddCoverPictureIdToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :cover_picture_id, :integer, :default => nil 
  end
end
