class AddPictureShapeToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :picture_shape, :integer, :default => nil 
  end
end
