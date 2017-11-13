class Structure < ActiveRecord::Base
  belongs_to :song
  belongs_to :chord
  belongs_to :element
  has_many :element_libraries
end
