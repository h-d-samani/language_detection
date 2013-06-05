class Language < ActiveRecord::Base
  attr_accessible :content, :name, :file
  
  validates :name, :file, :presence => true
  
  validates_uniqueness_of :name
  
  has_attached_file :file,
    :styles => {},
    :url => "/language/:id/:basename.:extension",
    :path => ":rails_root/lang/:id/:basename.:extension"
    
end
