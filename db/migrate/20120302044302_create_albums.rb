class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t| 
      t.string :title
      t.text :description 
      t.integer :user_id #user has many album 

      t.timestamps
    end
  end
end
