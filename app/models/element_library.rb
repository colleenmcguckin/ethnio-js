class ElementLibrary < ActiveRecord::Base
  belongs_to :element
  belongs_to :structure
end
