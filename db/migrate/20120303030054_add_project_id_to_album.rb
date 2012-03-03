class AddProjectIdToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :project_id, :integer 
  end
end
