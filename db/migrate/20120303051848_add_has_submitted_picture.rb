class AddHasSubmittedPicture < ActiveRecord::Migration
  def up
    add_column :albums, :has_submitted_picture, :boolean, :default => false 
  end

  def down
    remove_column :albums, :has_submitted_picture
  end
end
