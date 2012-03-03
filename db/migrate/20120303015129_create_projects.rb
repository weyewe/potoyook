class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title 
      t.text :front_page_description
      t.text :dashboard_description 
      
      t.datetime :deadline
      t.boolean :is_closed, :default => false 

      t.timestamps
    end
  end
end
