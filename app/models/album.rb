class Album < ActiveRecord::Base
  validates :title, :length => { :minimum => 2 }
  has_many :pictures
end
