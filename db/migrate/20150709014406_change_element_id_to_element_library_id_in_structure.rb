class ChangeElementIdToElementLibraryIdInStructure < ActiveRecord::Migration
  def change
    rename_column :structures, :element_id, :element_library_id
  end
end
