class Element < ActiveRecord::Base
  belongs_to :song
  has_many :element_libraries
  has_many :structures

  
end
