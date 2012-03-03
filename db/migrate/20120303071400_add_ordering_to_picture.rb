class AddOrderingToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :display_order, :integer , :default => nil 
  end
end
